class AddCheckInToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :check_in, :date
  end
end
