class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def take_turn
    game = Game.new(params.select{|k,v| k.match(/^grid/)}.values)
    if (winner = game.turn) == "draw" && (turns_left = game.turns_left) > 0
       @turns_left = turns_left
    else
      @winner = winner
      @turns_left = 0 
    end
  end

end
