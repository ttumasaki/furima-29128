class ItemsController < ApplicationController
  before_action :items_params, except: [:index, :new]
  before_action :move_to_sign_in, only: [:new]

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

  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end