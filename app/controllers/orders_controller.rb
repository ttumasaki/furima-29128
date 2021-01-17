class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def address_params
    params.require(:order_address).permit(:card_number, :exp_month, :exp_year, :cvc,
                                         :postal_code, :prefecture_id, :city,
                                         :address, :building_name, :phone_number)
                                  .merge(user_id: current_user.id, item_id: @item.id)
  end
end
