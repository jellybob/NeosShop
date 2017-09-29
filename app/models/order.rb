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

class Order < ApplicationRecord
  has_many :order_items
  has_many :users, through: :order_items # this needs more work as order will only have one user

  has_many :order_promotions
  has_many :promotions, through: :order_promotions

  has_one  :checkout

  default_scope { where(completed: false) }

  private

  def _update
    self[:subtotal] = _subtotal
    self[:total]    = _subtotal
    self.save!
  end

  def _subtotal
    @_subtotal ||= order_items.collect { |order_item| order_item.quantity * order_item.item.price }.sum
  end

  def _apply_promo_for_new_items
    self.promotions.each { |promo| _apply_promo_code(promo) }
  end

  # ==========================
  # Only apply promo on existing item.
  def _apply_promo_code(promo)
    self[:total] = _promo_type(promo)
    self.save!
  end

  protected

  def _promo_type(promo)
    case  promo.promo_type
      when 'PERCENT' then _percent_off(promo)
      when 'AMOUNT'  then _amount_off(promo)
      else raise '.. PromoType Not Recognised'
    end
  end

  def _percent_off(promo)
    self[:total] - (self[:total] * promo.code.fdiv(100))
  end

  def _amount_off(promo)
    self[:total] - promo.code
  end
end
