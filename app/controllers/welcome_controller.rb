
class WelcomeController < ApplicationController
before_action :authenticate_admin!, only: [:dashboard, :sales, :followup]
  def index
  end

  def dashboard
  	@destinations =Destination.all
  end

  def sales
  	@sales = User.all
  	@payments = Payment.all
  	#@payments_provider = User_provider.all	
  end
   def followup
    @sales = User.all
    @payments = Payment.all
    #@payments_provider = User_provider.all 
  end
end