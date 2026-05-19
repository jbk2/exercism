require_relative 'series'

RSpec.describe Series do
  it 'slices of one from one' do
    actual = Series.new('1').slices(1)
    expected = ['1']
    expect(actual).to eq(expected)
  end

  it 'slices of one from two' do
    actual = Series.new('12').slices(1)
    expected = %w[1 2]
    expect(actual).to eq(expected)
  end

  it 'slices of two' do
    actual = Series.new('35').slices(2)
    expected = ['35']
    expect(actual).to eq(expected)
  end

  it 'slices of two overlap' do
    actual = Series.new('9142').slices(2)
    expected = %w[91 14 42]
    expect(actual).to eq(expected)
  end

  it 'slices can include duplicates' do
    actual = Series.new('777777').slices(3)
    expected = %w[777 777 777 777]
    expect(actual).to eq(expected)
  end

  it 'slices of a long series' do
    actual = Series.new('918493904243').slices(5)
    expected = %w[91849 18493 84939 49390 93904 39042 90424 04243]
    expect(actual).to eq(expected)
  end

  it 'slice length is too large' do
    series = Series.new('12345')
    expect { series.slices(6) }.to raise_error(ArgumentError)
  end

  it 'slice length cannot be zero' do
    series = Series.new('12345')
    expect { series.slices(0) }.to raise_error(ArgumentError)
  end

  it 'slice length cannot be negative' do
    series = Series.new('123')
    expect { series.slices(-1) }.to raise_error(ArgumentError)
  end

  it 'empty series is invalid' do
    expect { Series.new(1) }.to raise_error(ArgumentError)
  end
end
