class UsersController < ApplicationController

  before_action :set_search

  def show
  end

  def edit
  end

  def identification
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
