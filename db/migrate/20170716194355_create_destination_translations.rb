
class CreateDestinationTranslations < ActiveRecord::Migration[5.0]
  def up
        Destination.create_translation_table!({
          :place => :string,
          :why_go => :text,
          :to_do => :text,
          :sights => :text,
          :festivals => :text,
          :sleep => :text,
          :eat => :text,
          :drink=> :text,
          :shop => :text,
          :around => :text
        }, {
          :migrate_data => true
        })
      end

   def down
        Destination.drop_translation_table! :migrate_data => true
   end
end