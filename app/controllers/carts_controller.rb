class CartsController < ApplicationController
  before_action :set_promotion

  include SessionConcern

  def show
    @order = _order
    @order_items = _order.order_items
    @order_promotion = OrderPromotion.new
    @applied_promotions = _order.order_promotions
  end

  def set_promotion
    @promotions = Promotion.all
  end
end
