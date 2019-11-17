class SignupController < ApplicationController

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
  end

  # ---------------
  # 電話番号の確認画面
  # ---------------
  def phone
    # registrationで入力された値をsessionに保存
    session[:nickname]              = user_params[:nickname]
    session[:email]                 = user_params[:email]
    session[:password]              = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name]             = user_params[:last_name]
    session[:first_name]            = user_params[:first_name]
    session[:last_name_kana]        = user_params[:last_name_kana]
    session[:first_name_kana]       = user_params[:first_name_kana]
    session[:birthday]              = user_birthday_join

    # 新規インスタンス作成
    @user = User.new
  end

  # ---------------
  # 電話番号認証画面
  # ---------------
  def phone2
    binding.pry
    # phoneで入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]

    # 新規インスタンス作成
    @authentication = SmsAuthenticationForm.new
  end

  # ---------------
  # 発送先・お届け先住所入力画面
  # ---------------
  def address
    # 新規インスタンス作成
    @user = User.new
  end

  # ---------------
  #  支払い方法画面
  # ---------------
  def payment
    # addressで入力された値をsessionに保存
    session[:postcode]         = user_params[:postcode]
    session[:prefecture_id]    = user_params[:prefecture_id]
    session[:city]             = user_params[:city]
    session[:address]          = user_params[:address]
    session[:building]         = user_params[:building]
    session[:phone_number_sub] = user_params[:phone_number_sub]

    # 新規インスタンス作成
    @user = User.new
  end

  # ---------------
  #  登録完了画面
  # ---------------
  def complete
    binding.pry
    # usersテーブル登録情報格納
    @user = User.new(
      # sessionに保存された値をインスタンスに渡す
      nickname:              session[:nickname],
      email:                 session[:email],
      password:              session[:password],
      last_name:             session[:last_name], 
      first_name:            session[:first_name], 
      last_name_kana:        session[:last_name_kana], 
      first_name_kana:       session[:first_name_kana], 
      birthday:              session[:birthday],
      phone_number:          session[:phone_number],
      postcode:              session[:postcode],
      prefecture_id:         session[:prefecture_id],
      city:                  session[:city],
      address:               session[:address],
      building:              session[:building],
      phone_number_sub:      session[:phone_number_sub],
      profile:"",
      point: 0
    )

    binding.pry
    # usersテーブル登録処理実行
    if @user.save!
      # 登録成功時
      binding.pry
      # ログインするための情報をsessionに保存
      session[:id] = @user.id
    else
      # 登録失敗時
      # 新規会員登録セレクト画面を表示
      render '/signup/index'
    end
    sign_in User.find(session[:id]) unless user_signed_in?
  end



  private

  # userモデルのparams
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation, 
      :last_name, 
      :first_name, 
      :last_name_kana, 
      :first_name_kana, 
      :phone_number,
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