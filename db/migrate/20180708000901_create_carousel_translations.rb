class CreateCarouselTranslations < ActiveRecord::Migration[5.0]
  def up
        Carousel.create_translation_table!({
          :body => :text,
          :carouselpic => :integer,
          :carouselpic1 => :integer,
          :carouselpic2 => :integer,
          :carouselpic3 => :integer
        }, {
          :migrate_data => true
        })
      end

   def down
        Carousel.drop_translation_table! :migrate_data => true
   end
end
