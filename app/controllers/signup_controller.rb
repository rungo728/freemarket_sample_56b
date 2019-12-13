class SignupController < ApplicationController

  require 'payjp'
  require 'twilio-ruby'

  # ---------------
  # ログイン方法選択画面
  # ---------------
  def index
  end

  # ---------------
  # 会員情報入力画面
  # ---------------
  def registration
    # 新規インスタンスを作成する
    # user_paramsでpersonalモデルの項目も取得できるようにする
    @user = User.new
    @user.build_personal
  end

  # facebook、googleアカウント用
  def registration_omniauth
    # 新規インスタンスを作成する
    # user_paramsでpersonalモデルの項目も取得できるようにする
    @user = User.new(
      nickname:              session[:omniauth_nickname],
      email:                 session[:omniauth_email]
    )
    @user.build_personal
  end

  # ---------------
  # 電話番号の確認画面
  # ---------------
  def phone
    # 会員情報入力画面で入力された値をsessionに保存する
    session[:nickname]              = user_params[:nickname]
    session[:email]                 = user_params[:email]
    session[:password]              = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name]             = user_params[:personal_attributes][:last_name]
    session[:first_name]            = user_params[:personal_attributes][:first_name]
    session[:last_name_kana]        = user_params[:personal_attributes][:last_name_kana]
    session[:first_name_kana]       = user_params[:personal_attributes][:first_name_kana]
    session[:birthday]              = user_birthday_join
    
    if session[:omniauth_password]
      session[:password]              = session[:omniauth_password]
    end

    # usersテーブル登録準備
    # 新規インスタンスを作成し、sessionに保存された値を格納する
    @user = User.new(
      nickname:              session[:nickname],
      email:                 session[:email],
      password:              session[:password],
      profile:"",
      point: 0,
      provider:              session[:omniauth_provider],
      uid:                   session[:omniauth_uid]
    )

    # usersテーブル登録処理実行
    # 登録成功時：ユーザーIDをsessionに保存し、未ログインの場合ログインする
    # 登録失敗時：会員情報入力画面を表示する
    if @user.save!
      session[:user_id] = @user.id
      sign_in User.find(session[:user_id]) unless user_signed_in?
    else
      render '/signup/registration'
      return
    end

    # personalsテーブル登録準備
    # 新規インスタンスを作成し、sessionに保存された値を格納する
    @personal = Personal.new(
      user_id:               session[:user_id],
      last_name:             session[:last_name],
      first_name:            session[:first_name],
      last_name_kana:        session[:last_name_kana],
      first_name_kana:       session[:first_name_kana],
      birthday:              session[:birthday]
    )

    # personalsテーブル登録処理実行
    # 登録失敗時：会員情報入力画面を表示する
    unless @personal.save!
      render '/signup/registration'
      return
    end

    # 電話番号の確認画面を表示する
    # 新規インスタンスを作成する
    @phone = Phone.new
  end

  # ---------------
  # SMS送信処理
  # ---------------
  def send_sms
    # 電話番号の確認画面で入力された値をsessionに保存する
    session[:phone_number] = phone_params[:phone_number]

    # 新規インスタンスを作成し、sessionに保存された値を格納する
    @phone = Phone.new(
      user_id:      session[:user_id],
      phone_number: session[:phone_number]
    )

    # 入力値チェック
    # 登録失敗時：電話番号の確認画面を表示する
    unless @phone.valid?
      render '/signup/phone'
      return
    end

    # SMS送信処理
    if phone_params[:phone_number].present?
      # 電話番号が取得できた場合
      # 取得した電話番号を+81にフォーマット
      phone_number = PhonyRails.normalize_number phone_params[:phone_number], country_code:'JP'
      # 認証番号（ランダムな4桁の整数）を生成し、sessionに格納する
      session[:secure_code] = rand(1000..9999)

      # SMS送信を行うための設定
      client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"],ENV["TWILIO_AUTH_TOKEN"])

      # 送信処理実行
      begin
        # 送信元、送信先、メッセージ文を設定し送信する
        client.messages.create(
          from: ENV["TWILIO_NUMBER"],
          to:   phone_number,
          body: "#{session[:secure_code]}"
        )
      rescue
        # 送信失敗時
        # 電話番号の確認画面を表示する
        redirect_to phone_signup_index_path
        return false
      end
      # 送信成功時
      # 電話番号認証画面を表示する
      redirect_to phone2_signup_index_path
    else
      # 電話番号が取得できなかった場合
      # 電話番号の確認画面を表示する
      redirect_to phone_signup_index_path
    end
  end
  
  # ---------------
  # 電話番号認証画面
  # ---------------
  def phone2
    # 新規インスタンスを作成
    @authentication = SmsAuthenticationForm.new
  end

  # ---------------
  # 認証番号確認処理
  # ---------------
  def check_sms
    if params[:sms_authentication_form][:secure_code].present?
      if session[:secure_code] === params[:sms_authentication_form][:secure_code].to_i
        # 生成された認証番号と入力された認証番号が一致した場合
        # phonesテーブル登録準備
        # 新規インスタンスを作成し、sessionに保存された値を格納する
        @phone = Phone.new(
          user_id:      session[:user_id],
          phone_number: session[:phone_number]
        )
        # phonesテーブル登録処理実行
        if @phone.save!
          # 登録成功時：発送先・お届け先住所入力画面を表示する
          redirect_to address_signup_index_path
        else
          # 登録失敗時：電話番号認証画面を表示する
          render '/signup/phone2'
        end
      else
        # 生成された認証番号と入力された認証番号が一致しなかった場合
        # 電話番号認証画面を表示する
        redirect_to phone2_signup_index_path
      end
    else
      # 認証番号が取得出来なかった場合
      # 電話番号認証画面を表示する
      redirect_to phone2_signup_index_path
    end
  end

  # ---------------
  # 発送先・お届け先住所入力画面
  # ---------------
  def address
    # 新規インスタンスを作成する
    @address = Address.new
  end

  # ---------------
  #  支払い方法画面
  # ---------------
  def payment
    # 発送先・お届け先住所入力画面で入力された値をsessionに保存する
    session[:address_last_name]        = address_params[:last_name]
    session[:address_first_name]       = address_params[:first_name]
    session[:address_last_name_kana]   = address_params[:last_name_kana]
    session[:address_first_name_kana]  = address_params[:first_name_kana]
    session[:postcode]                 = address_params[:postcode]
    session[:prefecture_id]            = address_params[:prefecture_id]
    session[:city]                     = address_params[:city]
    session[:address]                  = address_params[:address]
    session[:building]                 = address_params[:building]
    session[:phone_number_sub]         = address_params[:phone_number_sub]

    # addressesテーブル登録準備
    # 新規インスタンスを作成し、sessionに保存された値を格納する
    @address = Address.new(
      user_id:               session[:user_id],
      last_name:             session[:address_last_name], 
      first_name:            session[:address_first_name], 
      last_name_kana:        session[:address_last_name_kana], 
      first_name_kana:       session[:address_first_name_kana], 
      postcode:              session[:postcode],
      prefecture_id:         session[:prefecture_id],
      city:                  session[:city],
      address:               session[:address],
      building:              session[:building],
      phone_number_sub:      session[:phone_number_sub]
    )

    # addressesテーブル登録処理実行
    # 登録失敗時：発送先・お届け先住所入力画面を表示する
    unless @address.save!
      render '/signup/address'
      return
    end

    # 支払い方法画面を表示する（card_controllerのnewアクションを実行する）
    redirect_to new_card_path
  end

  # ---------------
  #  登録完了画面
  # ---------------
  def complete
  end


  private

  # userモデルのparams
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation,
      personal_attributes:[:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday]
    )
  end

  # phoneモデルのparams
  def phone_params
    params.require(:phone).permit(
      :phone_number
    )
  end

  # addressモデルのparams
  def address_params
    params.require(:address).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :postcode,
      :prefecture_id,
      :city,
      :address,
      :building,
      :phone_number_sub
    )
  end

  # 分割されている生年月日を結合する
  def user_birthday_join
    date = params[:birthday]

    if date['birthday(1i)'].empty? && date['birthday(2i)'].empty? && date['birthday(3i)'].empty?
      return
    else
      birthday = Date.new(
        date['birthday(1i)'].to_i,
        date['birthday(2i)'].to_i,
        date['birthday(3i)'].to_i)
    end
  end
end