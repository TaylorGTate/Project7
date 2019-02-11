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
    @show_counter = "You've visited this page #{@counter} times without buying anything... come on."if @counter > 5
  	@products = Product.order(:popularity).reverse_order
		respond_to do |format|
        format.html {
            if (params[:spa] && params[:spa] == "true")
                render 'index_spa'
            # the else case below is by default
            else
               render 'index'
            end
        }
        format.json {render json: @products}
    end
  end
end
