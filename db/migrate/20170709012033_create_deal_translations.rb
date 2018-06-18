class CreateDealTranslations < ActiveRecord::Migration[5.0]
  def up
        Deal.create_translation_table!({
          :place => :string,
          :description => :text,
          :details => :text,
          :other_details => :text,
          :policies_and_fees => :text,
          :price => :decimal
        }, {
          :migrate_data => true
        })
      end

   def down
        Deal.drop_translation_table! :migrate_data => true
   end
end
 