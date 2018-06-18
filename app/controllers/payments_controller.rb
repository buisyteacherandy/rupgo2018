class PaymentsController < ApplicationController
	before_action :authenticate_user!

def index
end
	def create
		payment = current_user.payments.new(deal_params)
		respond_to do |format|
			if payment.save
				payment.total = payment.deal.price * payment.quantity
				payment.save
				format.html { redirect_to route_path }
				format.json {head :no_content }
			else
				redirect_to Deal.find(deal_params[:deal_id]), error: "Sorry, We could not process your purchase"
				format.json {head :no_content}
		end
	end
end

	def route
		@payments = current_user.payments.where(state:1)
	end

	#def quantity
		#@payments = current_user.payments.find.last.quantity.
	#end

	def buys
		@payments = current_user.payments.where(state:2)
	end

	def check_in
		@payments = current_user.payments.find(params[:id])
	end

# creando la accion de remover deal
def destroy
   @payments = current_user.payments.where(state: '1').take.destroy
   redirect_to route_path
end

def edit
end

 #def destroy
    #@payments = current_user.payments.where(state: '1').take
    #@payments.destroy
    #redirect_to route_path
  #end

			
# aqui finaliza la accion de remover.


	def express
		price = current_user.pending_purchase_price
		response = EXPRESS_GATEWAY.setup_purchase(price * 100,
				ip: request.remote_ip,
				return_url: "http://localhost:3000/transactions/checkout",
				cancel_return_url: "http://localhost:3000/route",
				name: "RupGo checkout purchase",
				amount: price*100
			)
		redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token, review: false)
	end

	private

	def deal_params
		params.require(:payment).permit(:deal_id, :check_in, :check_out, :quantity, :daterange)
	end

end