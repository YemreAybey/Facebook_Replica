require 'test_helper'

class SignUpTest < ActionDispatch::IntegrationTest
def setup
 @pass = User.digest('password')
end
  test "validates first name and last name" do
    user = User.new(
    first_name: "asd",
    last_name: "",
    email: "hafizbadrie@hotmail.com",
    bio: "developer",
    address: {
      city: "Nai",
      country: "South America",
      zipcode: "+254",
      street: "5th" 
  },
  password: 'password',
  password_confirmation: 'password'
  )
  assert_no_difference 'User.count' do
     user.save
  end
  user.last_name = 'asdasd'
  assert_difference 'User.count', 1 do
    user.save
 end
end
end
