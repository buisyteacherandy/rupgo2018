class AddVideoDealToDeals < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :video_deal, :text
  end
end
