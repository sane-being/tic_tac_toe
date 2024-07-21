# frozen_string_literal: true

class Board
  WIN_COMB = [
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # vertical
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # horizontal
    [0, 4, 8], [2, 4, 6] # cross
  ].freeze

  def initialize
    @board = Array.new(9) { ' ' }
  end

  def player_turn(index, mark)
    raise 'Invalid input! Enter the index again' unless @board[index] == ' '

    @board[index] = mark
  end

  def check_for_win
    WIN_COMB.each do |array|
      arr = array.map { |i| @board[i] }
      arr = arr.uniq
      next unless arr.size == 1
      next if arr[0] == ' '

      return arr[0]
    end
    nil
  end

  def print
    puts "
    -----------
     #{@board[0]} | #{@board[1]} | #{@board[2]}
    -----------
     #{@board[3]} | #{@board[4]} | #{@board[5]}
    -----------
     #{@board[6]} | #{@board[7]} | #{@board[8]}
    -----------"
  end
end
