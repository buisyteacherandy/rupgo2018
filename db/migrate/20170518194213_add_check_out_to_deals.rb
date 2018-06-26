class AddCheckOutToDeals < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :check_out, :date
  end
end
