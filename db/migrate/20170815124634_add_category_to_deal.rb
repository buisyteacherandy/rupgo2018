class AddCategoryToDeal < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :category, :string
  end
end
