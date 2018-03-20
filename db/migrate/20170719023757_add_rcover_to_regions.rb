class AddRcoverToRegions < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :regions,:rcover
  end
end
