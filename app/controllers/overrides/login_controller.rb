class Overrides::LoginController < Devise::SessionsController

  skip_before_action :verify_signed_out_user, only: :destroy
  def create
    @user = User
             .find_by(email: params["email"])
    if @user && @user.valid_for_authentication? { @user.valid_password?(params[:password]) }
      sign_in(@user.class.name.downcase, @user, store: false)
      @token = JwtWrapper.encode(
        { sub: @user.id }
      )
      JwtCache.create(token: @token)
    end
  end

  def destroy
    @user = current_user
    JwtCache.find_by_token(token)&.destroy
  end

  private

  def token
    return nil if bearer_header.nil?
    strategy, jwt_token = bearer_header.split(' ')
    return nil if (strategy || '').downcase != 'bearer'
    jwt_token
  end

  def bearer_header
    request.headers['Authorization']&.to_s
  end

end
