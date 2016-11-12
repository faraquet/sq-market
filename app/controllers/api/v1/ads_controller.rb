class Api::V1::AdsController < ApplicationController
  def index
    @ads = Ad.all
  end

  def create
    @ad = Ad.new(ad_params)
    if !@ad.valid?
      render status: 400, json: { content: "Ad can't be created", errors: @ad.errors }
    else
      @ad.save
      render status: 200, json: { content: "Ad successfully created" }
    end
  end

  private

  def ad_params
    params.require(:ad).permit(:player_id, :product_id, :quantity, :price) 
  end  
end
