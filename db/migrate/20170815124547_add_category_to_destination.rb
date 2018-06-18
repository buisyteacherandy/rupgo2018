class AddCategoryToDestination < ActiveRecord::Migration[5.0]
  def change
    add_column :destinations, :category, :string
  end
end
