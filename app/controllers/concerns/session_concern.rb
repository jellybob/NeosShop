module SessionConcern
  extend ActiveSupport::Concern

  # simple check to see if Order could be initialized
  #   especially needed if Order is consuming API from external services or different DB.
  included do
    raise 'Order not initialized' unless Order.is_a?(Class) && Order.new.is_a?(Object)
  end

  private

  def _order
    _existing_order || _new_order
  end

  # Check if there is an active order
  #   based on a given session id.
  def _existing_order
    # p __method__
    # p session[:order_id]
    Order.find_by_id(session[:order_id])
  end

  def _new_order
    Order.new
  end

  # This is a very naive approach.
  # After clearing session, you would need to
  #   check mark order has been fulfilled.
  def _clear_session
    session[:_order] = nil
  end
end