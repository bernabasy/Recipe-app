def authenticate_test_user
  user = User.find_by(email: 'john@example.com')

  if user
    visit '/users/sign_in'
    fill_in 'Email*', with: 'john@example.com'
    fill_in 'Password*', with: 'password123'
    click_button 'Log in'
  else
    # sign up
    visit '/users/sign_up'
    fill_in 'Name*', with: 'John Doe'
    fill_in 'Email*', with: 'john@example.com'
    fill_in 'Password*', with: 'password123'
    fill_in 'Password Confirmation*', with: 'password123'
    click_button 'Sign up'
    user = User.find_by(email: 'john@example.com')
  end
  user
end
