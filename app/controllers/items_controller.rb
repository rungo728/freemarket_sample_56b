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
    @chanels = Item.includes(:photos).where(brand_id: 0).order("id DESC").limit(10)
    @vitons = Item.includes(:photos).where(brand_id: 1).order("id DESC").limit(10)
    @supremes = Item.includes(:photos).where(brand_id: 2).order("id DESC").limit(10)
    @nikes = Item.includes(:photos).where(brand_id: 3).order("id DESC").limit(10)
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
    @photo = Photo.find_by(item_id: @item.id)
    @user = User.find_by(id: @item.saler_id)
    @brand = Brand.find_by(id: @item.brand_id)
    @category = Category.find_by(id: @item.category_id)
    @user_items = Item.where(saler_id: @user.id).order("id DESC").limit(6)
    @user_items.each do |user_item|
      @user_item_photo = Photo.find_by(item_id: user_item.id)
    end
    @category_items = Item.includes(:photos).where(category_id: @category.id).order("id DESC").limit(6)
    @category_items.each do |category_item|
      @category_item_photo = Photo.find_by(item_id: category_item.id)
    end
    # @category_children = Category.find_by(name: @category.name, ancestry: nil).children
  end

  def new
  end

  private
  
  def set_search
    @q = Item.search(params[:q])
  end

  def search_params
    params.require(:q).permit(:name_cont)
  end
end
