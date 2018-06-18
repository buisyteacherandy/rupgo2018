class AddCategoryToSearch < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :category, :string
  end
end
