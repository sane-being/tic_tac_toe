# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# Creates Game object which is a new round of game.
class Game
  attr_accessor :board, :player1, :player2

  def initialize(p_1_name, p_2_name)
    @board = Board.new
    @player1 = Player.new(p_1_name, 'X')
    @player2 = Player.new(p_2_name, 'O')
  end

  def play
    puts "#{player1.name} will play with 'X'"
    puts "#{player2.name} will play with 'O'"
    loop do
      [player1, player2].each do |player|
        board.print
        puts "#{player.name}'s turn, input index:"
        begin
          board.player_turn(gets.to_i - 1, player.mark)
        rescue StandardError => e
          puts e.message
          retry
        end
        next if board.check_for_win.nil?

        board.print
        puts "#{player.name} has WON the game!!"
        return player
      end
    end
  end
end
