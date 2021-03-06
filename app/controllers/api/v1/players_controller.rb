class Api::V1::PlayersController < ApplicationController
  before_action :set_player, only: [:show]
  def index
    @players = Player.all
  end

  def show
  end
  
  def products
    player = Player.find(params[:player_id])
    @player_products = PlayerProduct.where(stock_id: player.stock.id)
    @stock = player.stock
  end

  private 

  def set_player
    @player = Player.find(params[:id])
  end
end
