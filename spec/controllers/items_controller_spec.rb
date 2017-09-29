require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
  end

  describe 'Items #index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it '@items should not be nil' do
      get :index
      expect(assigns(:items)).not_to eq(nil)
    end

    it '@order_item should not be nil' do
      get :index
      expect(assigns(:items)).not_to eq(nil)
    end
  end
end