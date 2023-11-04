class RegistrationController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    @user=User.create!(
      email:params[:email],
      password:params[:password],
      password_confirmation:params[:password_confirmation]
    )
  end

end