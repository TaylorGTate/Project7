class OrderPolicy
  attr_reader :current_account, :model

  def initialize(current_account, model)
    @current_account = current_account
    @order = model
  end

  def index?
    if (@current_account) 
        current_account.accountable_type == "Buyer"
    else
        false
     end 
  end

  def show?
    @order.buyer && @current_account == @order.buyer.account
  end

  def new?
    if (@current_account) 
      @current_account.accountable_type == "Buyer"
    else
      true
    end
  end

  def create?
    if (@current_account) 
      @current_account.accountable_type == "Buyer"
    else
      true
    end
  end

  def edit?
    @current_account == @order.buyer.account 
  end

  def update?
    @current_account == @order.buyer.account 
  end

  def destroy?
    @current_account == @order.buyer.account 
  end

  class Scope < Struct.new(:current_account, :model)
    def resolve
      model.where(buyer: current_account.accountable)
    end
  end

end
