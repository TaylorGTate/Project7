class SellerPolicy
  attr_reader :current_account, :model

  def initialize(current_account, model)
    @current_account = current_account
    @seller = model
  end

  def edit?
    @current_account == @seller.account
  end

  def update?
    @current_account == @seller.account
  end

  def show_orders_for_seller?
    @current_account == @seller.account
  end

end
