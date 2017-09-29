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

require 'test_helper'

class PromotionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
