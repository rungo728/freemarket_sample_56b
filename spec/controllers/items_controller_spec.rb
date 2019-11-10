require 'rails_helper'

describe ItemsController, type: :controller do
  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response). to render_template :index
    end
    it "populates an array of items ordered by created_at DESC" do
      category = build(:category)
      brand = build(:brand)
      prefecture = build(:prefecture)
      items = create_list(:item, 3)
      get :index
      expect(assigns(:items)).to match(items.sort{|a, b| b.id <=> a.id})
    end
  end
end