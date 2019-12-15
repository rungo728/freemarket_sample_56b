class UsersController < ApplicationController

  before_action :set_search

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def identification
  end

  def login
  end

  def logout
  end

  def card
  end

  def exhibiting
    @user = User.find(current_user.id)
    @items = Item.where(saler_id: @user.id).order("id DESC").limit(15)
  end

  private
  def set_search
    @q = Item.search(params[:q])
  end
end
