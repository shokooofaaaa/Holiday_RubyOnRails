class HolidaysController < ApplicationController
  before_action  only: %i[ show edit update destroy ]

  # GET /holidays or /holidays.json
  def index
    @holidays = Holiday.all
     @holiday = Holiday.new

    @users = User.all
    
    
  end

  # GET /holidays/1 or /holidays/1.json
  def show

     @holiday = Holiday.find(params[:id])
  end

  # GET /holidays/new
  def new
    @holiday = Holiday.new
  
  end

  # GET /holidays/1/edit
  def edit
    @holiday = Holiday.find(params[:id])
  end

  # POST /holidays or /holidays.json
  def create
    @holiday = Holiday.new(holiday_params)
  
    respond_to do |format|
      if @holiday.save
        format.html { redirect_to user_path(@holiday.user_id), notice: "Die Urlaub wurde erfolgreich erstellt." }
        format.json { render :show, status: :created, location: @holiday }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holidays/1 or /holidays/1.json
  def update
    @holiday = Holiday.find(params[:id])
    respond_to do |format|
      if @holiday.update(holiday_params)
        format.html { redirect_to user_path(@holiday.user_id), notice: "Die Urlaub wurde erfolgreich aktualisiert." }
        format.json { render :show, status: :ok, location: @holiday }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holidays/1 or /holidays/1.json
  def destroy
    @holiday = Holiday.find(params[:id])
    @holiday.destroy

    respond_to do |format|
      format.html { redirect_to user_path(@holiday.user_id), notice: "Die Urlaub wurde erfolgreich zerstört."  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    

    # Only allow a list of trusted parameters through.
    def holiday_params
      params.require(:holiday).permit(:from, :to, :user_id)
    end
end
