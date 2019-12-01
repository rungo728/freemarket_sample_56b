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

  describe 'GET #search' do
    it "renders the :search template" do
      items = create_list(:item, 3)
      get :search, params: { q:{name_cont: '商品'} }
      expect(assigns(:items)).to eq items
    end

  end

  describe 'GET #show' do
    it "renders the :show template" do
      item = create(:item)
      user = create(:user)
      get :show, id: item
      expect(response).to render_template :show
    end
  end
end