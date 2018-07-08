class AddCarouselpic3ToCarousel < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :carousels, :carouselpic3
  end
end
