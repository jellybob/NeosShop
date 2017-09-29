class OrderPromotionsController < ApplicationController
  before_action :_set_order_promotion, only: [:destroy]

  include SessionConcern

  def create
    order = _order.order_promotions.new(order_promotion_params)
    order.save!
    redirect_to carts_path
  end

  def destroy
    @order_promotion.destroy
    redirect_to carts_path
  end

  private

  def order_promotion_params
    params.require(:order_promotion).permit(:order_id, :promotion_id)
  end

  def _set_order_promotion
    @order_promotion = OrderPromotion.find_by_promotion_id(params[:id])
  end
end