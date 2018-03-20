class AddCatecoverToCategories < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :categories,:catecover
  end
end
