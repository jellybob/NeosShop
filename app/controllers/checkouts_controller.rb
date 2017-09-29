class CheckoutsController < ApplicationController

  # after_action :_clear_session, only: [:thank_you]

  include SessionConcern

  def index
    @order = _order
    @card = Card.new
  end

  def thank_you
    @order = Order.includes(:checkout, :order_items, :promotions).where('orders.id', _order.id).first
    _order.update_columns(completed: true)
  end
end
