module ControllerMacros
  def sign_in(user)
    # This method assumes that you are using Devise for authentication.
    # If you are using a different authentication solution, you may need
    # to adjust the code accordingly.
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end
end
