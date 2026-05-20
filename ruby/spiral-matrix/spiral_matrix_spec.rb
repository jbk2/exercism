require_relative 'spiral_matrix'

RSpec.describe SpiralMatrix do
  it 'empty spiral' do
    actual = SpiralMatrix.new(0).matrix
    expected = []
    expect(actual).to eq(expected)
  end

  it 'trivial spiral' do
    actual = SpiralMatrix.new(1).matrix
    expected = [[1]]
    expect(actual).to eq(expected)
  end

  it 'spiral of size 2' do
    actual = SpiralMatrix.new(2).matrix
    expected = [[1, 2], [4, 3]]
    expect(actual).to eq(expected)
  end

  it 'spiral of size 3' do
    actual = SpiralMatrix.new(3).matrix
    expected = [[1, 2, 3], [8, 9, 4], [7, 6, 5]]
    expect(actual).to eq(expected)
  end

  it 'spiral of size 4' do
    actual = SpiralMatrix.new(4).matrix
    expected = [[1, 2, 3, 4], [12, 13, 14, 5], [11, 16, 15, 6], [10, 9, 8, 7]]
    expect(actual).to eq(expected)
  end

  it 'spiral of size 5' do
    actual = SpiralMatrix.new(5).matrix
    expected = [[1, 2, 3, 4, 5], [16, 17, 18, 19, 6], [15, 24, 25, 20, 7], [14, 23, 22, 21, 8], [13, 12, 11, 10, 9]]
    expect(actual).to eq(expected)
  end
end
