class PurchasesController < ApplicationController
  def new
  	@product = Product.find(params[:id])
  	@purchase = Purchase.new
  	@purchase.product = @product
  end

  def create
  	@purchase = Purchase.new(purchase_params.merge( email: stripe_params["stripeEmail"],
  		                                              card_token: stripe_params["stripeToken"]))
  	if @purchase.valid?
	  	@purchase.process_payment
	  	@purchase.save
  	else
  		flash[:error] = "Transaction declined"
  		render :new
  	end
  end

  private
  def purchase_params
  	params.require(:purchase).permit(:name, :email, :address, :telephone, :card_token)
  end

  def stripe_params
  	params.permit(:stripeEmail, :stripeToken)
  end
end
