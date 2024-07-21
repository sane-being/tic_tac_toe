# frozen_string_literal: true

# Creates player objects
class Player
  attr_accessor :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end
