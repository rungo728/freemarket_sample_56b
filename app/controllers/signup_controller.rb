class SignupController < ApplicationController

  require 'payjp'
  require 'twilio-ruby'

  before_action :validates_registration, only: :phone # 新規会員登録画面の入力項目チェック
  before_action :validates_phone, only: :send_sms     # 電話番号の確認画面の入力項目チェック
  before_action :validates_address, only: :payment    # 発送先・お届け先住所入力画面の入力項目チェック


  # ---------------
  # ログイン方法選択画面
  # ---------------
  def index
  end

  # ---------------
  # 新規会員登録画面
  # ---------------
  def registration
    # 新規インスタンス作成
    @user = User.new
    @user.build_personal
  end

  # ---------------
  # 電話番号の確認画面
  # ---------------
  def phone
    # 新規インスタンス作成
    @phone = Phone.new
  end

  def send_sms
    if phone_params[:phone_number].present?
      # 電話番号が取得できた場合
      # 取得した電話番号を+81にフォーマット
      phone_number = PhonyRails.normalize_number phone_params[:phone_number], country_code:'JP'
      binding.pry
      # 認証番号（ランダムな4桁の整数）を生成し、sessionに格納
      session[:secure_code] = rand(1000..9999)

      # SMS送信を行うための設定
      client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"],ENV["TWILIO_AUTH_TOKEN"])
      binding.pry
      # 送信処理
      begin
        # 送信元、送信先、メッセージ文を設定し送信する
        client.messages.create(
          from: ENV["TWILIO_NUMBER"],
          to:   phone_number,
          # body: "認証番号：#{session[:secure_code]} この番号を電話番号認証画面で入力してください。"
          body: "#{session[:secure_code]}"
        )
        binding.pry
      rescue
        #送信失敗時
        redirect_to phone_signup_index_path
        return false
      end
      #送信成功時
      binding.pry
      # # step2で入力された値をsessionに保存
      # session[:phone_number] = phone_params[:phone_number]
      # 新規インスタンス作成
      # @user = User.new
      redirect_to phone2_signup_index_path
    else
      # 電話番号が取得できなかった場合
      redirect_to phone_signup_index_path
    end
  end
  
  # ---------------
  # 電話番号認証画面
  # ---------------
  def phone2
    # 新規インスタンス作成
    @authentication = SmsAuthenticationForm.new
  end

  def check_sms
    if params[:sms_authentication_form][:secure_code].present?
      # 認証番号が取得出来た場合
      if session[:secure_code] === params[:sms_authentication_form][:secure_code].to_i
        binding.pry
        # 生成された認証番号と入力された認証番号が一致した場合
        @phone = Phone.new(
          # sessionに保存された値をインスタンスに渡す
          user_id:      session[:user_id],
          phone_number: session[:phone_number]
        )
        # binding.pry
        render '/signup/phone2' unless @phone.save!
        redirect_to address_signup_index_path
      else
        binding.pry
        # 生成された認証番号と入力された認証番号が一致しなかった場合
        redirect_to phone2_signup_index_path
      end
    else
      binding.pry
      # 認証番号が取得出来なかった場合
      redirect_to phone2_signup_index_path
    end
  end

  # ---------------
  # 発送先・お届け先住所入力画面
  # ---------------
  def address
    # 新規インスタンス作成
    @address = Address.new
  end

  # ---------------
  #  支払い方法画面
  # ---------------
  def payment
    # 新規インスタンス作成
    @user = User.new
    redirect_to new_card_path
  end

  # ---------------
  #  登録完了画面
  # ---------------
  def complete
  end


  # ---------------
  #  バリデーション
  # ---------------
  # 画面遷移時に入力項目のバリデーションチェックを行う
  # エラーの場合は遷移元画面を再表示し、画面にエラーメッセージを表示する
  
  def validates_registration
    # step1で入力された値をsessionに保存
    session[:nickname]              = user_params[:nickname]
    session[:email]                 = user_params[:email]
    session[:password]              = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name]             = user_params[:personal_attributes][:last_name]
    session[:first_name]            = user_params[:personal_attributes][:first_name]
    session[:last_name_kana]        = user_params[:personal_attributes][:last_name_kana]
    session[:first_name_kana]       = user_params[:personal_attributes][:first_name_kana]
    session[:birthday]              = user_birthday_join
    
    @user = User.new(
      # sessionに保存された値をインスタンスに渡す
      nickname:              session[:nickname],
      email:                 session[:email],
      password:              session[:password],
      profile:"",
      point: 0
    )

    # 入力値チェック
      render '/signup/registration' unless @user.valid?

    # usersテーブル登録処理実行
    if @user.save!
      # 登録成功時
      # ログインするための情報をsessionに保存
      session[:user_id] = @user.id
      sign_in User.find(session[:user_id]) unless user_signed_in?
      # binding.pry
    else
      # 登録失敗時
      # 新規会員登録セレクト画面を表示
      render '/signup/index'
    end

    @personal = Personal.new(
      # sessionに保存された値をインスタンスに渡す
      user_id:               session[:user_id],
      last_name:             session[:last_name],
      first_name:            session[:first_name],
      last_name_kana:        session[:last_name_kana],
      first_name_kana:       session[:first_name_kana],
      birthday:              session[:birthday]
    )

    render '/signup/registration' unless @personal.valid?
    @personal.errors
    render '/signup/registration' unless @personal.save!
  end

  def validates_phone
    # step2で入力された値をsessionに保存
    session[:phone_number] = phone_params[:phone_number]

    @phone = Phone.new(
      # sessionに保存された値をインスタンスに渡す
      user_id:      session[:user_id],
      phone_number: session[:phone_number]
    )

    render '/signup/phone' unless @phone.valid?
  end

  def validates_address
    # step4で入力された値をsessionに保存
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

    @address = Address.new(
      # sessionに保存された値をインスタンスに渡す
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

    render '/signup/address' unless @address.valid?
    @address.errors
    render '/signup/address' unless @address.save!
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

  def phone_params
    params.require(:phone).permit(
      :phone_number
    )
  end

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