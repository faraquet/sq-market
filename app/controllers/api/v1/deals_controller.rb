class Api::V1::DealsController < ApplicationController
  before_action :set_deal, only: [:show]

  def index
    @deals = Deal.all
  end

  def show
  end

  def create
  end

  private 

  def set_deal
    @deal = Deal.find(params[:deal_id])
  end
end
