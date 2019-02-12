class StoreController < ApplicationController
  def sess_counter
  	if session[:counter].nil?
  		session[:counter] = 0
  	else
  		session[:counter] = session[:counter] + 1
  	end
  end
  def search
      products = Product.where("title LIKE '%#{params[:query]}%'")
      render json: products
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
        format.json {render json: Product.order(sort_by + ' ' + order)}
    end
  end
	private 
    def sort_by
       %w(title
          price
          popularity).include?(params[:sort_by]) ? params[:sort_by] : 'popularity'
    end
    def order
       %w(asc desc).include?(params[:order]) ? params[:order] : 'asc'
    end
end
