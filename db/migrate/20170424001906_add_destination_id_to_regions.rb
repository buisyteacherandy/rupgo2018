class AddDestinationIdToRegions < ActiveRecord::Migration[5.0]
  def change
    add_reference :regions, :destination, foreign_key: true
  end
end
