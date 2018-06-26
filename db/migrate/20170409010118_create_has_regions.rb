class CreateHasRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :has_regions do |t|
      t.references :deal, foreign_key: true
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
