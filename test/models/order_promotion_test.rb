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

require 'test_helper'

class OrderPromotionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
