class PurchasesController < ApplicationController
  def new
  	@product = Product.find(params[:id])
  	@purchase = Purchase.new
  	@purchase.product = @product
  end
end
