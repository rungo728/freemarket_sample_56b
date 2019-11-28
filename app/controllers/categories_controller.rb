class CategoriesController < ApplicationController
  before_action :set_search

  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    @category = Category.includes(:items).find(params[:id])
    @items = Item.includes(:photos).where(category_id: params[:id])
    @items = @items.page(params[:page])
  end

  private
  
  def set_search
    @q = Item.search(params[:q])
  end
end
