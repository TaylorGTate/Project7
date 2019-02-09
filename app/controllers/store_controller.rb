class StoreController < ApplicationController
  def sess_counter
  	if session[:counter].nil?
  		session[:counter] = 0
  	else
  		session[:counter] = session[:counter] + 1
  	end
  end	
  def index
  	@counter = sess_counter
  	@show_counter = "You've visited this page #{@counter} times." if @counter > 5
	@products = Product.order(:popularity).reverse_order
  end
end
