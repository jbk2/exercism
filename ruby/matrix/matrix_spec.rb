require_relative 'matrix'

RSpec.describe Matrix do
  it 'extracts row from one number matrix' do
    matrix = Matrix.new('1')
    expect(matrix.row(1)).to eq([1])
  end

  it 'can extract row' do
    matrix = Matrix.new("1 2\n3 4")
    expect(matrix.row(2)).to eq([3, 4])
  end

  it 'extracts row where numbers have different widths' do
    matrix = Matrix.new("1 2\n10 20")
    expect(matrix.row(2)).to eq([10, 20])
  end

  it 'can extract row from non-square matrix with no corresponding column' do
    matrix = Matrix.new("1 2 3\n4 5 6\n7 8 9\n8 7 6")
    expect(matrix.row(4)).to eq([8, 7, 6])
  end

  it 'extracts column from one number matrix' do
    matrix = Matrix.new('1')
    expect(matrix.column(1)).to eq([1])
  end

  it 'can extract column' do
    matrix = Matrix.new("1 2 3\n4 5 6\n7 8 9")
    expect(matrix.column(3)).to eq([3, 6, 9])
  end

  it 'can extract column from non-square matrix with no corresponding row' do
    matrix = Matrix.new("1 2 3 4\n5 6 7 8\n9 8 7 6")
    expect(matrix.column(4)).to eq([4, 8, 6])
  end

  it 'extracts column where numbers have different widths' do
    matrix = Matrix.new("89 1903 3\n18 3 1\n9 4 800")
    expect(matrix.column(2)).to eq([1903, 3, 4])
  end
end
