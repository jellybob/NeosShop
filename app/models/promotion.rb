# == Schema Information
#
# Table name: promotions
#
#  id         :integer          not null, primary key
#  code       :decimal(4, 2)
#  promo_type :string
#  standalone :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Promotion < ApplicationRecord
  has_many :order_promotions
  has_many :orders, through: :order_promotions

  def stand_alone_promo(id)
    self.class.find_by_id(id).standalone
  end
end
