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

require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
