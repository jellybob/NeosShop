class ItemsController < ApplicationController
  # before_action :_set_session

  include SessionConcern

  def index
    @items = Item.all
    @order_item = _order.order_items.new
  end
end
