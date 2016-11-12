class Api::V1::PlayersController < ApplicationController
  before_action :set_player, only: [:show]
  def index
    @players = Player.all
  end

  def show
  end
  
  def show_products
    player = Player.find(params[:player_id])
    @player_products = PlayerProduct.where(stock_id: player.stock.id)
  end

  private 

  def set_player
    @player = Player.find(params[:id])
  end
end
