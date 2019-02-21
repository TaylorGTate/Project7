class LineItemsController < ApplicationController
  include CurrentCart
  skip_before_action :verify_authenticity_token
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)
    session[:counter] = 0
    product.popularity = product.popularity + 1
    product.update_attribute(:popularity, product.popularity)
    product.save
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_index_url }
        format.js   { @current_item = @line_item }
        format.json { }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item , notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def decrement
    @line_item = LineItem.find(params[:id])
    @cart = Cart.find(session[:cart_id])
    product = Product.find(@line_item.product.id)
    @line_item = @cart.delete_line_item(product)
    product.popularity = product.popularity - 1
    product.update_attribute(:popularity, product.popularity)
    respond_to do |format|
      if @line_item.quantity <= 0
        @line_item.destroy
        format.html { redirect_to store_index_url }
        format.js   {@current_item = @line_item}
        format.json { }
      else 
        if @line_item.save
          format.html {redirect_to_store_index_url}
          format.js   {@current_item = @line_item}
          format.json { }
        else
          format.html { render :new }
          format.json { render json: @line_item.errors,
                        status: :unprocessable_entity}
        end
      end
    end
  end



  
  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
      if @line_item.cart_id != session[:cart_id]
      	invalid_line_item
   		end
    end
    def invalid_line_item
      logger.error"Attempt to access invaild line item #{params[:id]}"
      redirect_to line_items_url, notice: 'Invalid Line Item'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
  #...
end
