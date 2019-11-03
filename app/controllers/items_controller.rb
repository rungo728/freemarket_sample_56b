class ItemsController < ApplicationController
  def index
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

  def confirmation
  end
end
