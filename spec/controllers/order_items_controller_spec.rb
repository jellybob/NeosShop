require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do

  let(:valid_attributes) { {quantity: 1, item_id: 1, user_id: 1} }

  describe 'OrderItems #create' do
    context 'with valid params' do

      before(:each) do
        load "#{Rails.root}/db/seeds.rb"
      end

      it 'creates a new OrderItem' do
        expect{
          post :create, params: {order_item: valid_attributes}
        }.to change(OrderItem, :count).by(1)
      end


      it 'redirects to the created user_workout' do
        post :create, params: {order_item: valid_attributes}
        expect(response).to redirect_to(carts_path)
      end
    end
  end

  describe 'OrderItem #destroy' do
    context 'with deleting order_item' do

      before(:each) do
        load "#{Rails.root}/db/seeds.rb"
        post :create, params: { order_item: valid_attributes }
        @order_item_id = OrderItem.first.id
      end

      it 'deletes existing order_item' do
        post :destroy, params: { id: @order_item_id }
      end

      it 'order_item counts to ZERO' do
        post :destroy, params: { id: @order_item_id }
        expect(OrderItem.count).to eq(0)
      end
    end
  end
end