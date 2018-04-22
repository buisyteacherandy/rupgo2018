class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable, 
     :recoverable, :rememberable, :trackable, 
     :omniauth_providers => [:facebook, :google_oauth2]


 
  has_many :user_providers, :dependent => :destroy
  
  has_many :destinations
  has_many :deals, through: :payments
  has_many :payments
  has_many :transactions
  has_many :questions, dependent: :destroy
  has_many :comments, dependent: :destroy

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.name = auth.info.name
    user.last_name = auth.info.last_name
    user.nickname = auth.info.nickname
    user.image = auth.info.image
    user.password = Devise.friendly_token[0,20]
  end
end
  include PermissionsConcern

  def pending_purchase_price
    payments = self.payments.where(state: 1)
    total = 0
    payments.each do |payment|
      total = total + payment.total
    end
    return total
    #self.payments.where(state: 1).joins("INNER JOIN deals on deals.id == payments.deal_id").sum("price")
  end

end

