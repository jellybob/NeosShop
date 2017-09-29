# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :decimal(5, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :users, through: :order_items
end
