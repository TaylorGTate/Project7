class ProductPolicy
  attr_reader :current_account, :model

  def initialize(current_account, model)
    @current_account = current_account
    @product = model
  end

  def index?
    current_account.accountable_type == "Seller"
  end

  def show?
    @current_account == @product.seller.account
  end

  def new?
    current_account.accountable_type == "Seller"
  end

  def create?
    current_account.accountable_type == "Seller"
  end

  def edit?
    @current_account == @product.seller.account
  end

  def update?
    @current_account == @product.seller.account
  end

  def destroy?
    @current_account == @product.seller.account
  end

  class Scope < Struct.new(:current_account, :model)
    def resolve
        model.where(seller: current_account.accountable)
    end
  end

end
