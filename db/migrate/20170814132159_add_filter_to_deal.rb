class AddFilterToDeal < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :filter, :string
  end
end
