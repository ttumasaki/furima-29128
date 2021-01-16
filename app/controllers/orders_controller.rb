class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(address_params)
  end

  private

  def address_params
    params.require(:order_address).permit(:card_number, :exp_month, :exp_year, :cvc,
                                         :postal_code, :prefecture_id, :city,
                                         :address, :building_name, :phone_number)
  end
end
