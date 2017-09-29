# == Schema Information
#
# Table name: cards
#
#  id          :integer          not null, primary key
#  card_number :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
