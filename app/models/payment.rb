class Payment < ApplicationRecord
  belongs_to :deal
  belongs_to :user
  validates :deal_id, presence: true
  validates :user_id, presence: true
  before_save :default_values


  private

  def default_values
  	self.state ||= 1
  end


end