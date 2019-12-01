class CardsController < ApplicationController
  
  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    # redirect_to action: "show" if card.exists?
  end

  def pay
    # payjpとCardのデータベースを作成する
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      # トークンが正常に発行されていた場合、顧客情報をPAY.JPに登録する
      customer = Payjp::Customer.create(
      description: '登録テスト',  # なくてもOK
      email: current_user.email, # なくてもOK
      # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存する
      card: params['payjp-token'],
      metadata: {user_id: current_user.id} # なくてもOK
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to complete_signup_index_path
      else
        redirect_to action: "pay"
      end
    end
  end

  # ----------------
  # カード情報の削除
  # ----------------
  # def delete #PayjpとCardデータベースを削除します
  #   card = Card.where(user_id: current_user.id).first
  #   if card.blank?
  #   else
  #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     customer.delete
  #     card.delete
  #   end
  #     redirect_to action: "new"
  # end

  # ----------------
  # カード情報の表示
  # ----------------
  # def show #Cardのデータpayjpに送り情報を取り出します
  #   card = Card.where(user_id: current_user.id).first
  #   if card.blank?
  #     redirect_to action: "new" 
  #   else
  #     Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     @default_card_information = customer.cards.retrieve(card.card_id)
  #   end
  # end
end
