# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  # Facebookアカウントによる認証
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      # 認証画面で選択したアカウントのemailが登録済みだった場合ログインする
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Facebook'
      sign_in_and_redirect @user, event: :authentication
    else
      # 認証画面から取得したデータをセッションに格納する
      session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra) 
      session[:omniauth_nickname]     = @user.nickname
      session[:omniauth_email]        = @user.email
      session[:omniauth_password]     = @user.password
      session[:omniauth_provider]     = @user.provider
      session[:omniauth_uid]          = @user.uid

      # 会員情報入力画面（facebook、googleアカウント用）へ遷移する
      redirect_to registration_omniauth_signup_index_path, alert: @user.errors.full_messages.join("\n")
    end
  end

  # googleアカウントによる認証
  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      # 認証画面で選択したアカウントのemailが登録済みだった場合ログインする
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      # 認証画面から取得したデータをセッションに格納する
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
      session[:omniauth_nickname]   = @user.nickname
      session[:omniauth_email]      = @user.email
      session[:omniauth_password]   = @user.password
      session[:omniauth_provider]   = @user.provider
      session[:omniauth_uid]        = @user.uid

      # 会員情報入力画面（facebook、googleアカウント用）へ遷移する
      redirect_to registration_omniauth_signup_index_path, alert: @user.errors.full_messages.join("\n")
    end
  end

  def failure
    redirect_to root_path
  end
end
