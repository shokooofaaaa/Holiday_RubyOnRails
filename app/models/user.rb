class User < ApplicationRecord 

  has_many :holidays, dependent: :destroy
 def to_s
 name
 end

   validates :name, presence: true
   validates_presence_of :name, :message => "can't be empty"
   
   
end


