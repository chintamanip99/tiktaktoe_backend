class Overrides::SessionsController < Devise::SessionsController

  skip_before_action :verify_signed_out_user, only: :destroy
  def create
    debugger
    @user = User
             .find_by(email: params["email"])
    if @user && @user.valid_for_authentication? { @user.valid_password?(params[:password]) }
      sign_in(@user.class.name.downcase, @user)
      @auth_user=current_user
    end
  end

  def logged_in
    if @current_user
      render json:{
        logged_in:true,
        user:@current_user
      }
    else
      render json:{
        logged_in:false
      }
    end
  end

  def logout
    render json:{
      status:200,logged_out: true
    }
  end
end
