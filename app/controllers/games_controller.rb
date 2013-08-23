class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def take_turn
    game = Game.new(params.select{|k,v| k.match(/^grid/)}.values)
    Rails.logger.info("<><><><><><><><>BOARD=#{game.board}")
    Rails.logger.info("<><><><><><><><>BOARD_STR=#{game.send(:board_string)}")
    if (winner = game.turn) == "draw" && (turns_left = game.turns_left) > 0
       @turns_left = turns_left
    else
      @winner = winner
      @turns_left = 0 
    end
    Rails.logger.info("<><><><><><><><>WINNER=#{winner.inspect}")
    Rails.logger.info("<><><><><><><><>@WINNER=#{@winner.inspect}")
    #render :json => @winner
  end

end
