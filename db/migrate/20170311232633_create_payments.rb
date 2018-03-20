class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :deal, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :state

      t.timestamps
    end
  end
end
