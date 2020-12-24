class ItemsController < ApplicationController
  before_action :items_params,except:[:index, :new]

  def index
  end

  def new
    @item = Item.new
  end

  private
  def items_params
    params.require(:item).permit(:name,
                                 :explanation,
                                 :category_id,
                                 :status_id,
                                 :fee_burden_id,
                                 :prefecture_id,
                                 :day_required_id,
                                 :price,
                                 :user)
  end
end