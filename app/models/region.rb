class Region < ApplicationRecord
	validates :name, presence: true
	has_many :destinations, through: :has_regions

	has_many :has_regions
	has_many :deals, through: :has_regions

	has_attached_file :rcover, styles: { medium: "1280x720", thumb: "800x600"}
  	validates_attachment_content_type :rcover, content_type: /\Aimage\/.*\Z/
end
