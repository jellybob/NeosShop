# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  subtotal   :decimal(12, 3)
#  total      :decimal(12, 3)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  completed  :boolean          default("f"), not null
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
  end

  let(:order)  { Order.create! }
  let(:item)   { Item.find(1) }
  let(:params) { { quantity: 1, item_id: item.id, user_id: 1 } }
  let(:promo_20_percent) { promo(1) }
  let(:promo_05_percent) { promo(2) }
  let(:promo_20_amount)  { promo(3) }

  let(:param_20_per) { { order_id: 1, promotion_id: 1 } }
  let(:param_05_per) { { order_id: 1, promotion_id: 2 } }
  let(:param_20_amt) { { order_id: 1, promotion_id: 3 } }

  def promo(id); Promotion.find(id); end

  describe 'Order #_update' do
    before(:each) do
      @oi = order.order_items.new(params)
      @oi.save
      @order = @oi.order
    end

    it 'update subtotal' do
      expect(@order.subtotal).to eq(@order.order_items.collect{|oi| oi.total_price}.sum)
    end

    it 'update total' do
      expect(@order.total).to eq(@order.order_items.collect{|oi| oi.total_price}.sum)
    end
  end

  describe 'Order #_subtotal' do
    before(:each) do
      @oi = order.order_items.new(params)
      @oi.save
      @order = @oi.order
    end

    it "return subtotal of Order's order_items" do
      expect(@order.send(:_subtotal)).to eq(@order.order_items.collect { |order_item| order_item.quantity * order_item.item.price }.sum)
    end
  end
end
