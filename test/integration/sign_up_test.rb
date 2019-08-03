require 'test_helper'

class SignUpTest < ActionDispatch::IntegrationTest
def setup
 @pass = User.digest('password')
end
  test "validates first name and last name" do
    user = User.new(
    first_name: "asd",
    last_name: "",
    email: "hafsdfbadrie@hotmail.com",
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
  
end
  test "creates user perfectly" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
    post signup_path, params: { user: { first_name: "asd",last_name: "asdfa",
                                        email: "hvbhf@hotmail.com",
                                        bio: "developer",
                                        address: {
                                          city: "Nai",
                                          country: "South America",
                                          zipcode: "+254",
                                          street: "5th" 
                                        },
                                      password: 'password',
                                      password_confirmation: 'password' } }
    end
  end
end
