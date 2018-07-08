class AddCarouselpicToCarousel < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :carousels, :carouselpic
  end
end
