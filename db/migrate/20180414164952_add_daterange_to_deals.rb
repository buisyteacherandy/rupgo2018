class AddDaterangeToDeals < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :daterange, :string
  end
end
