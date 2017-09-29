# == Schema Information
#
# Table name: checkouts
#
#  id         :integer          not null, primary key
#  email      :string
#  card_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address    :string
#  order_id   :integer
#

class Checkout < ApplicationRecord
  belongs_to :card
  belongs_to :order

  validates_presence_of :email
end
