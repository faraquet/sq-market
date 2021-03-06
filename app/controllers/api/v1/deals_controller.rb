class Api::V1::DealsController < ApplicationController
  before_action :set_deal, only: [:show]

  def index
    @deals = Deal.all
  end

  def show
  end

  def create
    @ad = Ad.find_by(id: params[:ad_id])
    return render status: 404, json: { content: "Ad not found" } if @ad.nil?
    @deal = Deal.new(seller_id: @ad.player_id, buyer_id: deal_params[:buyer_id], 
        product_id: @ad.product_id, quantity: @ad.quantity, price: @ad.price, total: @ad.total)
    
    if !@deal.valid?
      render status: 400, json: { content: "Deal can't be created", errors: @deal.errors }
    else
      @deal.save
      Ad.destroy(@ad)
      render status: 200, json: { content: "Deal successfully created" }
    end

  end

  private    

  def set_deal
    @deal = Deal.find(params[:deal_id])
  end

  def deal_params
    params.require(:deal).permit(:buyer_id, :ad_id) 
  end
end
