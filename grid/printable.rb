# Print grid given current grid object's content
module Printable
  def print_grid
    self.content.each_with_index do |line, i|
      puts "   1   2   3 " if i == 0
      puts if i == 0

      line.each_index do |j|
        print "#{("A".ord + i).chr} " if j == 0

        if line[j] == nil
          print "   "
        else
          print " " + line[j] + " "
        end

        if j < 2
          print "|"
        else
          puts " "
        end
      end
        
      puts "  ---+---+---" if i < 2
    end
    puts
  end
end