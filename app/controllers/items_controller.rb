class ItemsController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  private
  def items_params
    params.require(:item).permit(:image).merge(:user_id)
  end
end
