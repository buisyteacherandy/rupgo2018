class AddCheckInToDeals < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :check_in, :date
  end
end
