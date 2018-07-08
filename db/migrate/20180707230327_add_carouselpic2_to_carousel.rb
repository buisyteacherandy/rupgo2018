class AddCarouselpic2ToCarousel < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :carousels, :carouselpic2
  end
end
