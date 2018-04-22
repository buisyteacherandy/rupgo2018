class AddTotalToPayment < ActiveRecord::Migration[5.0]
  def change
  	add_column :payments, :total, :integers
  end
end
