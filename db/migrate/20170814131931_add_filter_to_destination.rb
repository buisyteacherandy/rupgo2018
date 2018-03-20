class AddFilterToDestination < ActiveRecord::Migration[5.0]
  def change
    add_column :destinations, :filter, :string
  end
end
