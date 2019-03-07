class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :ensure_cart_isnt_empty, only: :new
  before_action :ensure_cart_isnt_empty, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :invalid_order
  
  def pundit_user
    current_account
  end

  # GET /orders
  # GET /orders.json
  def index
		#if (params[:buyer_id])
     # @buyer = Buyer.find(params[:buyer_id])
      #@orders = @buyer.orders.order('created_at desc').page params[:page]
    #else
      #@orders = Order.all
      #@orders = @orders.order('created_at desc').page params[:page]
  	#end
		authorize Order 
    @orders = policy_scope(Order)
    @orders = @orders.order('created_at desc').page params[:page]
	end
  # GET /orders/1
  # GET /orders/1.json
  def show
		authorize @order
    @products = @order.products
  end

  # GET /orders/new
  def new
		@order = Order.new
		authorize @order

    if current_account && current_account.accountable_type == "Buyer"
        @order.name     = current_account.accountable.name
        @order.address  = current_account.accountable.address
        @order.email  = current_account.email
        @order.pay_type = current_account.accountable.pay_type.to_i
    end

    respond_to do |format|
      format.html
      format.json { render json: {"redirect":true,"redirect_url": new_order_path }}
    end
	end
  

  # GET /orders/1/edit
  def edit
	authorize @order
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
		authorize @order
		if current_account && current_account.accountable_type == "Buyer"
            @order.buyer = current_account.accountable
    end
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        #OrderNotifierMailer.received(@order).deliver
        format.html { redirect_to store_index_url, notice: 
          'Thank you for your order.' }
        format.json { render :show, status: :created,
          location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors,
          status: :unprocessable_entity }
      end  
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
		authorize @order
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
		authorize @order
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end
		
		def invalid_order
			logger.error"Attempt to access invalid order #{params[:id]}"
			redirect_to store_index_url, notice: 'Invalid order'
		end

    def ensure_cart_isnt_empty
      if @cart.line_items.empty?
        redirect_to store_index_url, notice: 'Your cart is empty'
      end
    end
    
end 
