class OrderItemsController < ApplicationController
  before_action :_set_order_item, only: [:destroy]

  include SessionConcern
  include OrderItemConcern

  def create
    @active_order = _order.order_items.new(order_item_params)
    if @active_order.save!
      _update_session
      return redirect_to carts_path
    end
    redirect_to items_path
  end

  def update; end

  def destroy
    @order_item.destroy
    redirect_to carts_path
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :item_id, :user_id)
  end

  def _set_order_item
    @order_item = OrderItem.find(params[:id])
  end
end
