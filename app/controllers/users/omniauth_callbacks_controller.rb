class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    auth = request.env["omniauth.auth"]
    logger.debug auth.info
    #logger.debug auth.credentials
    @user = User.omniauth(auth)
    return failure unless @user.persisted?

    sign_in_and_redirect @user
  end

  def twitter
    auth = request.env["omniauth.auth"]
    #logger.debug auth
    @user = User.omniauth(auth)
    return failure unless @user.persisted?

    sign_in_and_redirect @user
  end

  def failure
    redirect_to root_path
  end
end