class PersonalsController < ApplicationController

  before_action :get_personal
  before_action :set_search

  def edit
  end

  def update
    @personal.update(personal_params)

    if @personal.save
      redirect_to edit_personal_path, notice: '更新が完了しました'
    else
      render 'edit'
    end
  end

  private

  def get_personal
    @personal = Personal.find_by(user_id: current_user.id)
  end

  def personal_params
    binding.pry
    params.require(:personal).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :postcord, :prefecture_id, :city, :address, :building)
  end

  def set_search
    @q = Item.search(params[:q])
  end
end
