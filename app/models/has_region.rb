class HasRegion < ApplicationRecord
  belongs_to :deal
  belongs_to :destination
  belongs_to :region

end
