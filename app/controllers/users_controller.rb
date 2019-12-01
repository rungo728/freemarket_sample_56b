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

  private
  def set_search
    @q = Item.search(params[:q])
  end
end
