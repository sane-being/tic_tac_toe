# frozen_string_literal: true

require_relative 'lib/game'

def input_name(num)
  puts "Enter player #{num} name:"
  gets.chomp
end

new_game = Game.new(input_name(1), input_name(2))
new_game.play
