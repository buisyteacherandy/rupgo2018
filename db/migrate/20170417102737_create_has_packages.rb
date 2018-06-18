class CreateHasPackages < ActiveRecord::Migration[5.0]
  def change
    create_table :has_packages do |t|
      t.references :destination, foreign_key: true
      t.references :deal, foreign_key: true

      t.timestamps
    end
  end
end
