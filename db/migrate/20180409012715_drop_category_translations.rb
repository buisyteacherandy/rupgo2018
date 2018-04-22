class DropCategoryTranslations < ActiveRecord::Migration[5.0]
  def change
  	drop_table :category_translations
  end
end
