class ItemsController < ApplicationController

  before_action :set_search
  
  def index
    #テストで用いた記述
    @items = Item.all.order("id DESC").limit(10)
    #カテゴリーごとに並べる
    @ladies = Item.includes(:photos).where(category_id: 0..199).order("id DESC").limit(10)
    @mens = Item.includes(:photos).where(category_id: 200..345).order("id DESC").limit(10)
    @phones = Item.includes(:photos).where(category_id: 898..983).order("id DESC").limit(10)
    @toys = Item.includes(:photos).where(category_id: 685..797).order("id DESC").limit(10)
    #ブランドごとに並べる
    @chanels = Item.includes(:photos).where(brand: "シャネル").order("id DESC").limit(10)
    @vitons = Item.includes(:photos).where(brand: "ルイヴィトン").order("id DESC").limit(10)
    @supremes = Item.includes(:photos).where(brand: "シュプリーム").order("id DESC").limit(10)
    @nikes = Item.includes(:photos).where(brand: "ナイキ").order("id DESC").limit(10)
  end

  def search
    @q = Item.includes(:photos).ransack(search_params)
    @items = @q.result(distinct: true).page(params[:page]).per(10).limit(20)
    @itemsall = Item.all.order("id DESC").limit(20)
  end

  # 商品購入確認画面
  def confirmation
    @item = Item.find(params[:id])
    @address = Address.find_by(user_id: current_user.id)
    card = Card.where(user_id: current_user.id).first
    if card.present?
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    # else
    # # 支払い登録していない場合はマイページの支払い方法登録画面に遷移。
    #   redirect_to card_users_path, notice: "購入に進むには支払い方法の登録が必要です。画面より登録をしてください。"
    end
  end

  # 商品詳細画面
  def show
    @item = Item.find(params[:id])
    @user = User.find_by(id: @item.saler_id)
    @user_items = Item.where(saler_id: @user.id).order("id DESC").limit(6)
    @category_items = Item.where(category_id: @item.category.id).order("id DESC").limit(6)
  end

  def new
    @item = Item.new
    6.times{@item.photos.build}
    
    @parents = Category.where(ancestry: nil)
  end

  def create
    @item = Item.create(item_params)

    if @item.save
      redirect_to root_path, notice: '出品が完了しました'
    else
      render 'new'
    end
  end


  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end
  
  def edit
    @item = Item.find(params[:id])
    num = @item.photos.length
    num = 6 - num
    num.times{@item.photos.build}
    
    # 最上層のカテゴリーを取得
    @parents = Category.where(ancestry: nil)
    # 編集する商品の最上層カテゴリーを指定
    @root = @item.category.root_id
    # 編集する商品の中層カテゴリーを指定
    @children = Category.find(@root.to_s).children
    # 編集する商品の最下層カテゴリーを指定
    @grandchildren = Category.find(@item.category.parent_id).children
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)

    if @item.save
      redirect_to root_path, notice: '更新が完了しました'
    else
      render 'edit'
    end
  end

  # 子カテゴリーidを取得するためのアクション
  def get_category_children

    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json { render 'new', json: @children }
    end
  end

  # 孫カテゴリーidを取得するためのアクション
  def get_category_grandchildren
    @grandchildren = Category.find(params[:child_id]).children
    respond_to do |format|
      format.html
      format.json { render 'new', json: @grandchildren}
    end
  end

  # 商品購入の為のpayjpに決済情報とトークンを送る際の定義を記述
  def buy
    @item = Item.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @item.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    redirect_to action: :done
  end

  # 商品購入完了画面
  def done
    @item_buyer = Item.find(params[:id])
    @item_buyer.update(buyer_id: current_user.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :size, :status, :brand, :shipping_charge, :shipping_method, :prefecture_id, :days_before_shipment, :price, photos_attributes: [:id, :photo, :_destroy]).merge(saler_id: current_user.id)
  end
  
  def set_search
    @q = Item.search(params[:q])
  end

  def search_params
    params.require(:q).permit(:name_cont)
  end
end
