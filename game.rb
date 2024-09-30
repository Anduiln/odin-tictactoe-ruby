require_relative "grid/grid"

class Game
  attr_reader :turn

  def initialize
    @grid = Grid.new()
    @turn = 0
  end

  # Check that current coordinates are empty, then validate player move
  def new_turn(player, coordinates)
    if @grid.check(coordinates) == nil
      @grid.add(player, coordinates)
      @turn += 1
      return 1
    else
      return nil
    end
  end

  # Check if a given player has won (after turn 5)
  def has_won?(player)
    if @grid.has_row_of_three?(player) && @turn >= 5 
      return true
    else
      return false
    end
  end

  def print_grid
    puts "\nTurn #{@turn}"
    @grid.print_grid
  end
end