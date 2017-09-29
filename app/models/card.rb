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

class Card < ApplicationRecord
  belongs_to :user
  has_many :checkouts

  accepts_nested_attributes_for :checkouts, allow_destroy: true

  validates_presence_of :card_number, numericality: { only_integer: true, greater_than: 15 }

  before_save :apply_sha

  def apply_sha
    self[:card_number] = Digest::SHA384.hexdigest "#{self[:card_number]}#{hashing_salt}"
  end

  protected

  def hashing_salt
    '04fd26e126da6bd56703a2106c43bd3546308b3781a4c10d287975c8991ab22c5b767a389b077b143e63ed3e5c1b7163b8beab30cb9ba840862aec2cf57dd659'
  end

end
