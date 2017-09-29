module OrderItemConcern
  extend ActiveSupport::Concern

  def _update_session
    session[:order_id] = @active_order.order_id
  end

  def _redirect(path)
    Proc.new { |p| redirect_to p }
  end

end