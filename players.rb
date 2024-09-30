class Players
  attr_accessor :crosses
  attr_accessor :noughts

  def initialize
    puts "Who will be playing Xs?"
    @crosses = gets.chomp 
    puts "Who will be playing Os?"
    @noughts = gets.chomp
  end
end