class AddRegionIdToDestinations < ActiveRecord::Migration[5.0]
  def change
    add_reference :destinations, :region, foreign_key: true
  end
end
