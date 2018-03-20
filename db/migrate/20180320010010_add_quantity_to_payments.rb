class AddQuantityToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :quantity, :integer
  end
end
