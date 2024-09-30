 # Check if full line, column or diagonal of X or O exist
 module Winnable
  def has_row_of_three?(player)
    for i in 0..2
      # Iterate over diagonal entries
      if @content[i][i] == player
        # Only check full diagonal the first time to avoid repeats
        if i == 0
          for j in 1..2
            if @content[i + j][i + j] != player
              break
            elsif j == 2
              return true
            end
          end
        end

        # Check line corresponding to current diagonal entry
        for k in 1..2
          if @content[(i + k) % 3][i] != player
            break
          elsif k == 2
            return true
          end
        end

        # Check column corresponding to current diagonal entry
        for l in 1..2
          if @content[i][(i + l) % 3] != player
            break
          elsif l == 2
            return true
          end
        end
      end

      # Return false at end of loop if not returned true yet
      if i == 2
        return false
      end
    end
  end
 end