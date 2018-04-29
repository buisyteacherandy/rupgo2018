class AddTotalToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :total, :integer
  end
end
