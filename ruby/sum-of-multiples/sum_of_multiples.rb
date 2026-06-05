=begin
Write your code for the 'Sum Of Multiples' exercise in this file. Make the tests in
`sum_of_multiples_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/sum-of-multiples` directory.
=end


class SumOfMultiples

  attr_accessor :items

  def initialize(*items)
    @items = items
  end

  def to(level)
    return 0 if items.all? { |item| item >= level }

    points = []

    items.each do |item|
      next if item >= level

      n = item
      
      while n < level
        points << n
        n += item
      end
    end

    points.uniq.sum
  end

end

s = SumOfMultiples.new(3, 5).to(4)
puts s.inspect
