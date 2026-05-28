class SpiralMatrix
  
  attr_accessor :spiral
  
  def initialize(size)
    @size = size
    @spiral = nil
  end

  ###  alternative approaches:
  # - keep a direction variable, iterate setting cell by cell, if cell already completed
  #   or out of bounds then pivot directction / pivot right
  # - 
  #
  def matrix
    return [] if @size == 0 

    obj = Array.new(@size) { Array.new(@size) }

    lower_row_bounds = 0
    upper_row_bounds = @size - 1
    lower_col_bounds = 0
    upper_col_bounds = @size - 1

    count = 1
    length = @size * @size

    # within_bounds = lambda { |r, c|
    #   (lower_col_bounds..upper_col_bounds).include?(c) &&
    #     (lower_row_bounds..upper_row_bounds).include?(r)
    # }

    # binding.irb
    until count > length do
      # Upper row
      r_i = lower_row_bounds
      (lower_col_bounds..upper_col_bounds).each do |c_i|
        obj[r_i][c_i] = count
        count += 1
      end
      lower_row_bounds += 1
      break if count > length
      
      # end col
      c_i = upper_col_bounds
      (lower_row_bounds..upper_row_bounds).each do |r_i|
        obj[r_i][c_i] = count
        count += 1
      end
      upper_col_bounds -= 1
      break if count > length
      
      # lower_row
      r_i = upper_row_bounds
      upper_col_bounds.downto(lower_col_bounds).each do |c_i|
        obj[r_i][c_i] = count
        count += 1
      end
      upper_row_bounds -= 1
      break if count > length
      
      # start col
      c_i = lower_col_bounds
      upper_row_bounds.downto(lower_row_bounds).each do |r_i|
        obj[r_i][c_i] = count
        count += 1
      end
      lower_col_bounds += 1
      break if count > length
    end
      # if within_bounds(r_i, c_i)
      #   count += 1
      #   operator = increment ? :+ : :-

      #   if col_axis
      #     c_i = c_i.send(operator, 1)
      #   else
      #     r_i = r_i.send(operator, 1)
      #   end
      # else
      #   col_axis = !col_axis
      # end
  
    obj
  end
end


s = SpiralMatrix.new(6)
s.matrix.each { |r| puts r.to_s + "\n" }
puts s.spiral.inspect