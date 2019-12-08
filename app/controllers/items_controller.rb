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

  def confirmation
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find_by(id: @item.saler_id)
    @user_items = Item.where(saler_id: @user.id).order("id DESC").limit(6)
    @category_items = Item.where(category_id: @item.category.id).order("id DESC").limit(6)
  end

  def new
    @item = Item.new
    10.times{@item.photos.build}
    
    @parents = Category.where(ancestry: nil)
  end

  def create
    Item.create(item_params)
    redirect_to action: 'index'
  end

  def edit
    @item = Item.find(params[:id])
    num = @item.photos.length
    num = 10 - num
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

    redirect_to action: 'index'
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

  private

  def item_params
    # @item = Item.find(params[:id])
    # @photo = @item.photos.find(params[:item]['photos_attributes']['0']['id'])

    binding.pry
    params.require(:item).permit(:name, :description, :category_id, :size, :status, :brand, :shipping_charge, :shipping_method, :prefecture_id, :days_before_shipment, :price, photos_attributes: [:photo]).merge(saler_id: current_user.id)
  end
  
  def set_search
    @q = Item.search(params[:q])
  end

  def search_params
    params.require(:q).permit(:name_cont)
  end
end
