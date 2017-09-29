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

class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  belongs_to :user

  validates_presence_of :quantity, numericality: { only_integer: true, greater_than: 0 }
  # validate :unit_price_present?
  validate :order_present?

  before_save :_update_order_item
  after_save  :_update_order
  after_destroy :_update_order

  private

  def order_present?
  	errors.add(:order, 'Order is not present') if order.nil?
  end

  def unit_price_present?
    errors.add(:unit_price, 'Price is empty! Data manipulation detected!') if unit_price.nil?
  end

  def _update_order_item
  	self[:unit_price]  = item.price.to_f
  	self[:total_price] = quantity * item.price.to_f
  end

  def _update_order
    self.order.send(:_update)
    self.order.send(:_apply_promo_for_new_items)
  end
end