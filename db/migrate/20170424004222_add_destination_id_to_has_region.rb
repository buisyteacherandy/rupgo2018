class AddDestinationIdToHasRegion < ActiveRecord::Migration[5.0]
  def change
    add_reference :has_regions, :destination, foreign_key: true
  end
end
