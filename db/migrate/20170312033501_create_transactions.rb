class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.string :token
      t.string :payerid
      t.references :user, foreign_key: true
      t.decimal :total, precision: 10, scale: 3
      t.string :answer

      t.timestamps
    end
  end
end
