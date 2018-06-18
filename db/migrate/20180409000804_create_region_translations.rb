class CreateRegionTranslations < ActiveRecord::Migration[5.0]
  def up
        Region.create_translation_table!({
          :name => :string,
          :rcover => :string
        }, {
          :migrate_data => true
        })
      end

   def down
        Region.drop_translation_table! :migrate_data => true
   end
end
