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

require 'test_helper'

class CheckoutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
