require 'rails_helper'

RSpec.describe OrderPromotion, type: :model do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
  end

  let(:order)   { Order.create! }
  let(:item)    { Item.find(1) }
  let(:params)  { {quantity: 1,   item_id: item.id, user_id: 1} }
  let(:order_promotion) { OrderPromotion }

  let(:param_20_per) { { order_id: 1, promotion_id: 1 } }
  let(:param_05_per) { { order_id: 1, promotion_id: 2 } }
  let(:param_20_amt) { { order_id: 1, promotion_id: 3 } }

  describe 'OrderPromotion.. ' do
    context ' 20 percent standalone code exists.. ' do
      before(:each) do
        @oi = order.order_items.new(params)
        @oi.save
        @order = @oi.order
        order_promotion.new(param_20_per).save!
      end

      it '05 percent off should be declined' do
        expect(order_promotion.new(param_05_per).valid?).to eq(false)
      end

      it '20 pounds off should be declined' do
        expect(order_promotion.new(param_20_amt).valid?).to eq(false)
      end
    end

    context ' Apply normal promo code and prevent standalone at all cost' do
      before(:each) do
        @oi = order.order_items.new(params)
        @oi.save
        @order = @oi.order
      end

      it 'declines 20 percent off promo when 05 percent promo exists' do
        order_promotion.new(param_05_per).save
        expect(order_promotion.new(param_20_per).valid?).to eq(false)
      end

      it 'declines 20 percent off promo when 20 amount promo exists' do
        order_promotion.new(param_20_amt).save
        expect(order_promotion.new(param_20_per).valid?).to eq(false)
      end
    end

    context ' Apply normal promo codes ' do
      before(:each) do
        @oi = order.order_items.new(params)
        @oi.save
        @order = @oi.order
      end

      it 'apply 05 percent off promo' do
        expect(order_promotion.new(param_05_per).save).to eq(true)
      end

      it 'apply 20 percent off promo' do
        expect(order_promotion.new(param_20_amt).save).to eq(true)
      end
    end
  end
end
