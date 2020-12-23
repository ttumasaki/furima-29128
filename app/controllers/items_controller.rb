class ItemsController < ApplicationController
<<<<<<< Updated upstream
  def index
  end
=======


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
>>>>>>> Stashed changes
end
