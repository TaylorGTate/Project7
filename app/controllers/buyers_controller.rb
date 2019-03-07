class BuyersController < ApplicationController
  before_action :set_buyer, only: [:edit, :update]

  # GET /buyers/1/edit
  def edit
  end

  # PATCH/PUT /buyers/1
  # PATCH/PUT /buyers/1.json
  def update
    respond_to do |format|
      if @buyer.update(buyer_params)
        format.html { redirect_to store_index_url, notice: "The profile of the buyer #{@buyer.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer
      @buyer = Buyer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buyer_params
      params.require(:buyer).permit(:name, :address, :pay_type)
    end
end
