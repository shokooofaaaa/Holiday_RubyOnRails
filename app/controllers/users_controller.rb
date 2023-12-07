class UsersController < ApplicationController
 #  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
    @holidays = Holiday.all
    

  end

  # GET /users/1 or /users/1.json
  def show
    
    @users = User.all
    @holiday = Holiday.new
        @user = User.find(params[:id])


    @holidays= Holiday.where(user_id: @user.id)
   # @user = User.find(params[:id])
   # @holiday = Holiday.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
    

 
  end

  # GET /users/1/edit
  def edit
     @user = User.find(params[:id])
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path }
      
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end




    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "Der Benutzer wurde erfolgreich aktualisiert." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "Der Benutzer wurde erfolgreich zerstört." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name)
    end
    
     
end
