class Category < ApplicationRecord
	validates :name, presence: true
	has_many :has_categories
	has_many :destinations, through: :has_categories
	has_attached_file :catecover, styles: { medium: "1280x720", thumb: "800x600"}
  	validates_attachment_content_type :catecover, content_type: /\Aimage\/.*\Z/
end
