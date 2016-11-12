class Api::V1::AdsController < ApplicationController
  def index
    @ads = Ad.all
  end

  private

  def ad_params
    params.require(:ad).permit(:player_id, :product_id, :quantity, :price) 
  end  
end
