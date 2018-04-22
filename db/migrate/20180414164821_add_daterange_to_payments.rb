class AddDaterangeToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :daterange, :string
  end
end
