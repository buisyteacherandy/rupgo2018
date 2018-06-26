class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.string :place
      t.text :description
      t.text :details
      t.text :other_details
      t.text :policies_and_fees
      t.decimal :price, precision: 10, scale: 3
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
