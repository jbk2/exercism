class Series
  def initialize(str_input)
    @input = parse_input(str_input)
  end

  def slices(length)
    raise ArgumentError if length > @input.length || length < 1
    slices = []

    idx = 0

    while @input[idx + (length - 1)]
      slices << @input.slice(idx, length)
      idx += 1
    end
    
    slices
  end

  private
  def parse_input(input)
    raise ArgumentError, "input was not a string" unless input.is_a?(String)
    raise ArgumentError, "string was empty" if input.empty?
    input
  end


end