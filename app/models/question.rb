class Question < ApplicationRecord
  belongs_to :user
  belongs_to :deal
  validates :body, presence: true
end
