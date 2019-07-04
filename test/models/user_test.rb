require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name:"James", email:"j@gmail.com", password:"gaylord199",
     password_confirmation:"gaylord199")
   end

   test "associated microposts should be deleted along with user" do
     @user.save
     @user.microposts.create!(content:"Rolling down the street in my 64")
     assert_difference 'Micropost.count', -1 do
       @user.destroy
     end
   end
end
