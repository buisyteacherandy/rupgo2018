class AddDestinationIdToDeals < ActiveRecord::Migration[5.0]
  def change
    add_reference :deals, :destination, foreign_key: true
  end
end
