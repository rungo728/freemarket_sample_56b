class CategoriesController < ApplicationController
  before_action :set_search

  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    @category = Category.includes(:items).find(params[:id])
    if @category.ancestry
      if @category.children.present?
        @family = "child" 
      else
        @family = "grandchild"
      end
    else
      @family = "parent"
    end
    @items = Item.includes(:photos).where(category_id: params[:id]).order("updated_at DESC")
    @items = @items.page(params[:page])
  end

  private
  
  def set_search
    @q = Item.search(params[:q])
  end
end
