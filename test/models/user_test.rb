require "test_helper"

class UserTest < ActiveSupport::TestCase
  fixtures :users
   test "User attributes must not be empty" do
     user= User.new
     assert user.invalid?
     assert user.errors[:name].any? 
     assert_equal [I18n.translate('errors.messages.blank')],
                 user.errors[:name]
   
   end
   
   test 'true' do
     user = User.new(name: users(:one).name)

     assert user.valid?
     end


end
