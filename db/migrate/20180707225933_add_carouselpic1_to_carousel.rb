class AddCarouselpic1ToCarousel < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :carousels, :carouselpic1
  end
end
