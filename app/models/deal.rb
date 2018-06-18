class Deal < ApplicationRecord
  translates :place, :description, :details, :other_details, :policies_and_fees, :price
  belongs_to :user
  belongs_to :destination
  has_many :questions, dependent: :destroy

  #has_many :has_regions
  #has_many :regions, through: :has_regions

  has_many :has_packages
  has_many :destinations, through: :has_packages

  has_many :payments
  validates :place, presence: true, uniqueness: true
  #after_create :save_regions
  before_save :default_price

  has_attached_file :pic, styles: { medium: "1280x720", thumb: "800x600"}
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/
  
  has_attached_file :pic1, styles: { medium: "1280x720", thumb: "800x600"}
  validates_attachment_content_type :pic1, content_type: /\Aimage\/.*\Z/
  

  #def regions=(value)
    #@regions = value
  #end
  
  	def default_price
  		self.price ||= 0
	end

	def user_already_paid? user_id
		self.payments.where(state:2).size > 0
	end

  private

end

