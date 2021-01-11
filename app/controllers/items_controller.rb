class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: [:new]
  before_action :set_item, only: :create

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show  
    @items = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
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
                                 :image)
          .merge(user_id: current_user.id)
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.new(items_params)
  end
end
