require_relative '../sum_of_multiples'

RSpec.describe SumOfMultiples do
  it 'has no multiples within limit' do
    actual = SumOfMultiples.new(3, 5).to(1)
    expected = 0
    expect(actual).to eq(expected)
  end

  it 'one factor has multiples within limit' do
    actual = SumOfMultiples.new(3, 5).to(4)
    expected = 3
    expect(actual).to eq(expected)
  end

  it 'more than one multiple within limit' do
    actual = SumOfMultiples.new(3).to(7)
    expected = 9
    expect(actual).to eq(expected)
  end

  it 'more than one factor with multiples within limit' do
    actual = SumOfMultiples.new(3, 5).to(10)
    expected = 23
    expect(actual).to eq(expected)
  end

  it 'each multiple is only counted once' do
    actual = SumOfMultiples.new(3, 5).to(100)
    expected = 2318
    expect(actual).to eq(expected)
  end

  it 'a much larger limit' do
    actual = SumOfMultiples.new(3, 5).to(1000)
    expected = 233_168
    expect(actual).to eq(expected)
  end

  it 'three factors' do
    actual = SumOfMultiples.new(7, 13, 17).to(20)
    expected = 51
    expect(actual).to eq(expected)
  end

  it 'factors not relatively prime' do
    actual = SumOfMultiples.new(4, 6).to(15)
    expected = 30
    expect(actual).to eq(expected)
  end

  it 'some pairs of factors relatively prime and some not' do
    actual = SumOfMultiples.new(5, 6, 8).to(150)
    expected = 4419
    expect(actual).to eq(expected)
  end

  it 'one factor is a multiple of another' do
    actual = SumOfMultiples.new(5, 25).to(51)
    expected = 275
    expect(actual).to eq(expected)
  end

  it 'much larger factors' do
    actual = SumOfMultiples.new(43, 47).to(10_000)
    expected = 2_203_160
    expect(actual).to eq(expected)
  end

  it 'all numbers are multiples of 1' do
    actual = SumOfMultiples.new(1).to(100)
    expected = 4950
    expect(actual).to eq(expected)
  end

  xit 'no factors means an empty sum' do
    actual = SumOfMultiples.new.to(10_000)
    expected = 0
    expect(actual).to eq(expected)
  end

  it 'the only multiple of 0 is 0' do
    actual = SumOfMultiples.new(0).to(1)
    expected = 0
    expect(actual).to eq(expected)
  end

  xit 'solutions using include-exclude must extend to cardinality greater than 3' do
    actual = SumOfMultiples.new(2, 3, 5, 7, 11).to(10_000)
    expected = 39_614_537
    expect(actual).to eq(expected)
  end
end
