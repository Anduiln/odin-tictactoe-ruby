require_relative "printable"
require_relative "winnable"

class Grid
  include Printable
  include Winnable
  attr_accessor :content

  # Create Grid with all coordinates empty
  def initialize
    @content = Array.new(3) {Array.new(3)}
  end

  # Return content of given coordinates, provided in the "A1" format
  def check(coordinates)
    return @content[coordinates[0].ord - "A".ord][coordinates[1].to_i - 1]
  end

  # Add X or O to given coordinates
  def add(player, coordinates)
    @content[coordinates[0].ord - "A".ord][coordinates[1].to_i - 1] = player
  end

end