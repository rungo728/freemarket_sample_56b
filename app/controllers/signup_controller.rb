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
    # 新規インスタンス作成
    @user = User.new
  end

  # ---------------
  # 電話番号認証画面
  # ---------------
  def phone2
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
  end

  # ---------------
  #  登録完了画面
  # ---------------
  def complete
  end
end