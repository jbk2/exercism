class Matrix
  def initialize(str)
    @str = str    
    @rows = parse_rows
    @cols = parse_cols
  end

  def row(i)
    @rows[i - 1]
  end

  def column(i)
    @cols[i - 1]
  end

  private
  def parse_rows
    @str.split("\n").map { |el| el.split(" ").map(&:to_i) }
  end

  def parse_cols
    # cols = Array.new(@rows.count) { [] }
    cols = Hash.new { |h, k| h[k] = [] }
    @rows.each do |row|
      # puts row.split(' ').inspect
      row.each_with_index { |el, col_idx| cols[col_idx] << el }
    end
    cols
  end
  
end

# m = Matrix.new("1 2 3\n4 5 6\n7 8 9")
# m = Matrix.new("1")
# m = Matrix.new("1 2 3 4\n5 6 7 8\n9 8 7 6")
# m = Matrix.new("89 1903 3\n18 3 1\n9 4 800")

# puts m.inspect