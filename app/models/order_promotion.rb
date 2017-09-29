# == Schema Information
#
# Table name: order_promotions
#
#  id           :integer          not null, primary key
#  order_id     :integer
#  promotion_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class OrderPromotion < ApplicationRecord
  belongs_to :order
  belongs_to :promotion

  validate :standalone_promo?
  validate :normal_and_standalone_promo?
  validate :promo_code_exists?

  after_save :_update_order
  after_destroy :_reapply_promo_if_any

  # We don't want to raise error if promotions is empty.
  # Check if standalone promotion exists.
  def standalone_promo?
    errors.add(:promotion_id, "#{unique} exists!") if !promotions.empty? && promotions.map(&:standalone).include?(true)
  end

  # If normal promo exists! then do not add standalone promo
  def normal_and_standalone_promo?
    # Guard clause to ensure promo code is definitely a standalone promo
    return unless promotion.stand_alone_promo(self[:promotion_id])
    if !promotions.empty? && !promotions.map(&:standalone).include?(true)
      return errors.add(:promotion_id, '..other promo exists!')
    end
  end

  def promo_code_exists?
    errors.add(:promotion_id, 'exists!') if !promotions.empty? && promotions.map(&:id).include?(self[:promotion_id])
  end

  # raise self.order.order_promotions.inspect # gives you existing and new promotion
  def promotions
    @promotions ||= order.promotions
  end

  def unique_promo
    name = promotions.where(standalone: true).select(:code, :promo_type).first
    "#{name.code} #{name.promo_type}"
  end

  alias_method :unique, :unique_promo

  private

  def _update_order
    self.order.send(:_apply_promo_code, self.promotion)
  end

  def _reapply_promo_if_any
    self.order.send(:_update)
    self.order.send(:_apply_promo_for_new_items)
  end
end
