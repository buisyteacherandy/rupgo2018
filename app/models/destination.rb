class Destination < ApplicationRecord
	include AASM
	translates :place, :why_go, :to_do, :sights, :festivals, :sleep, :eat, :drink, :shop, :around
	has_many :deals, dependent: :nullify
	has_many :comments, dependent: :nullify
	has_many :has_regions, dependent: :nullify
  	has_many :regions, through: :has_regions, dependent: :nullify
	belongs_to :user
	

	has_many :has_categories, dependent: :nullify
	has_many :categories, through: :has_categories, dependent: :nullify

	validates :place, presence: true, uniqueness: true
	validates :why_go, presence: true

	after_create :save_categories
	after_create :save_regions

	has_attached_file :cover, styles: { medium: "1280x720", thumb: "800x600"}
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

	scope :publicados, ->{ where(state: "published") }

	scope :ultimos, ->{ order("created_at DESC") }

	#has_many :has_packages
	#has_many :deals, through: :has_packages, dependent: :destroy

	def categories=(value)
		@categories = value
	end

	def regions=(value)
    	@regions = value
  	end

	aasm column: "state" do
		state :in_draft, initial: true
		state :published

		event :publish do
			transitions from: :in_draft, to: :published
		end

		event :unpublish do
			transitions from: :published, to: :in_draft
		end
	end

	private

	def save_categories
		@categories.each do |category_id|
			HasCategory.create(category_id: category_id,destination_id: self.id)
		end
	end

	def save_regions
    	@regions.each do |region_id|
      		HasRegion.create(region_id: region_id,destination_id: self.id)
    end
  end

  	def self.search(search)
  		if search
  			where(["place LIKE ?", "%#{search}%"])
  		else
  			all
  		end
  	end

end
