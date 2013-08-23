class Game
  include ActiveModel::Model

  TTT = /(?:x{3}|o{3})|
         (?:([xo])|_)(?:([xo])|_)(?:([xo])|_)\n
         (?:
            (?:
               (?:(\1)[xo_]{2}\n){2}|
               (?:[xo_](\2)[xo_]\n){2}|
               (?:[xo_]{2}(\3)\n){2}
            )|
            (?:[xo_](\1)[xo_]\n[ox_]{2}\1\n)|
            (?:[xo_](\3)[xo_]\n\3[xo_]{2}\n)
          )/ix

  def initialize(moves=nil)
    @board = moves || Array.new(9, '_')
  end

  def board
    @board
  end

  def turns_left
    @board.count('_')
  end

  def valid_board?
    (@board.count('x') - @board.count('o')).abs <= 1
  end

  def turn
    (matches = board_string.match(TTT)) ? "#{((matches_only = matches.to_a.compact).size == 1) ? matches[0][0] : matches_only.last} wins" : "draw"
  end
 
  private

  def board_string
    @board.each_slice(3).to_a.map(&:join).join("\n") + "\n"
  end
end
