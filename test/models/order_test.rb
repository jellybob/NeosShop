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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
