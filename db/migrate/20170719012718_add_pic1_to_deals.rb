class AddPic1ToDeals < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :deals,:pic1
  end
end
