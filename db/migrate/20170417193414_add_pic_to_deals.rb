class AddPicToDeals < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :deals,:pic
  end
end
