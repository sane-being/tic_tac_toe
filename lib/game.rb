# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(p_1_name, p_2_name)
    @board = Board.new
    @player_1 = Player.new(p_1_name, 'X')
    @player_2 = Player.new(p_2_name, 'O')
  end

  def play
    puts "#{player_1.name} will play with 'X'"
    puts "#{player_2.name} will play with 'O'"
    loop do
      [player_1, player_2].each do |player|
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
        return
      end
    end
  end
end
