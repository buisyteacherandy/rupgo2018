class CreateCategoryTranslations < ActiveRecord::Migration[5.0]
 def up
        Category.create_translation_table!({
          :name => :string,
          :catecover => :string
        }, {
          :migrate_data => true
        })
      end

   def down
        Category.drop_translation_table! :migrate_data => true
   end
end