# == Schema Information
#
# Table name: order_items
#
#  id          :integer          not null, primary key
#  item_id     :integer
#  order_id    :integer
#  user_id     :integer
#  quantity    :integer
#  total_price :decimal(12, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  unit_price  :decimal(5, 2)
#

require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
  end

  let(:order)                   { Order.create! }
  let(:item)                    { Item.find(1) }
  let(:params)                  { {quantity: 1,   item_id: item.id, user_id: 1} }
  let(:missing_item_params)     { {quantity: 1,   item_id: nil,     user_id: 1} }
  let(:missing_quantity_params) { {quantity: nil, item_id: item.id, user_id: 1} }

  describe 'OrderItem' do
    it 'creates a new OrderItem' do
      oi = order.order_items.new(params).save
      expect(oi).to eq(true)
    end
  end

  describe 'OrderItem check it only accepts valid params' do
    it 'does not save when item_id is missing' do
      oi = order.order_items.new(missing_item_params).save
      expect(oi).to eq(false)
    end

    it 'does not save when quantity is missing' do
      oi = order.order_items.new(missing_quantity_params).save
      expect(oi).to eq(false)
    end
  end

  describe 'OrderItem update order_item and order' do
    before(:each) do
      @oi = order.order_items.new(params)
      @oi.save
      @order = @oi.order
    end

    it 'updates order_item- unit_price' do
      expect(@oi.unit_price).to eq(item.price)
    end

    it 'updates order_item- unit_price' do
       expect(@oi.total_price).to eq(@oi.quantity * @oi.unit_price)
    end


    it 'updates order- subtotal' do
      expect(@order.subtotal).to eq(@oi.total_price)
    end

    it 'updates order- total' do
      expect(@order.total).to eq(@order.order_items.collect{|oi| oi.total_price}.sum)
    end
  end
end
