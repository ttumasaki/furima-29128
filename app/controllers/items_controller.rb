class ItemsController < ApplicationController
  before_action :items_params

  def index
  end

  private
  def items_params
    params.require(:item).permit(:image).merge(:user)
  end
end
