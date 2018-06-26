class Transaction < ApplicationRecord
  belongs_to :user
  validates :token, presence: true
  validates :payerid, presence: true
  validates :ip_address, presence: true

  def pay?
  	response = purchase_processing
  	self.answer = response.message 
  	self.save
  	if response.success?
  		self.user.payments.each do |payment|
  			payment.update(state:2)
  		end
  		true
  	else
  		false
  	end
  end
  private

  def purchase_processing
  	EXPRESS_GATEWAY.purchase(self.user.pending_purchase_price * 100, purchase_options)
  end
  def purchase_options
  	{
  		ip: self.ip_address,
  		token: self.token,
  		payer_id: self.payerid
  	}
  end
end
