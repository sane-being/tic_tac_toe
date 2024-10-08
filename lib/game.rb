# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# Creates Game object which is a new round of game.
class Game
  attr_accessor :board, :player1, :player2

  def initialize
    @board = Board.new
    @player1 = Player.new(input_name(1), :X)
    @player2 = Player.new(input_name(2), :O)
    puts player1
    puts player2
  end

  def input_name(num)
    puts "Enter player #{num} name:"
    gets.chomp
  end

  def take_turn_input(player)
    puts board
    puts "#{player.name}'s turn (#{player.mark}), input index to make a move:"
    begin
      board.player_turn(gets.to_i - 1, player.mark)
    rescue StandardError => e
      puts e.message
      retry
    end
  end

  def declare_winner(player)
    puts board
    puts "#{player.name} has WON the game!!"
    player
  end

  def play
    loop do
      [player1, player2].each do |player|
        take_turn_input(player)
        return declare_winner(player) if board.player_won?
      end
    end
  end
end
