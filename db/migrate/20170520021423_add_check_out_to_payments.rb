class AddCheckOutToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :check_out, :date
  end
end
