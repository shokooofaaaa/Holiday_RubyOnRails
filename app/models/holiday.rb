class Holiday < ApplicationRecord

  belongs_to :user
  
  validates :from, :to, presence: true
  validates :to, comparison: { greater_than: :from }
  
  
  
  
  def start_time
    self.from

  end
   
  def end_time
  
    self.to
    
  end  
  

 
end

