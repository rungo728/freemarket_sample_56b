class ItemsController < ApplicationController
  def index
    @ladies = Item.includes(:photos).where(category_id: 0..199).order("id DESC").limit(10)
  end

  def confirmation
  end
end
