class PersonalsController < ApplicationController

  before_action :get_personal
  before_action :set_search

  def edit
  end

  def update
  end

  private

  def get_personal
    @personal = Personal.find_by(user_id: current_user.id)
  end

  def set_search
    @q = Item.search(params[:q])
  end
end
