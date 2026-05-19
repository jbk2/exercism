require_relative 'anagram'

RSpec.describe Anagram do
  it 'has no matches' do
    detector = Anagram.new('diaper')
    anagrams = detector.match(%w[hello world zombies pants])
    expected = %w[]

    expect(anagrams).to eq(expected)
  end

  it 'detects two anagrams' do
    detector = Anagram.new('solemn')
    anagrams = detector.match(%w[lemons cherry melons])
    expected = %w[lemons melons]

    expect(anagrams).to eq(expected)
  end

  it 'does not detect anagram subsets' do
    detector = Anagram.new('good')
    anagrams = detector.match(%w[dog goody])
    expected = %w[]

    expect(anagrams).to eq(expected)
  end

  it 'detects anagram' do
    detector = Anagram.new('listen')
    anagrams = detector.match(%w[enlists google inlets banana])
    expected = %w[inlets]

    expect(anagrams).to eq(expected)
  end

  it 'detects three anagrams' do
    detector = Anagram.new('allergy')
    anagrams = detector.match(%w[gallery ballerina regally clergy largely leading])
    expected = %w[gallery regally largely]

    expect(anagrams).to eq(expected)
  end

  it 'detects multiple anagrams with different case' do
    detector = Anagram.new('nose')
    anagrams = detector.match(%w[Eons ONES])
    expected = %w[Eons ONES]

    expect(anagrams).to eq(expected)
  end

  it 'does not detect non-anagrams with identical checksum' do
    detector = Anagram.new('mass')
    anagrams = detector.match(%w[last])
    expected = %w[]

    expect(anagrams).to eq(expected)
  end

  it 'detects anagrams case insensitively' do
    detector = Anagram.new('Orchestra')
    anagrams = detector.match(%w[cashregister Carthorse radishes])
    expected = %w[Carthorse]

    expect(anagrams).to eq(expected)
  end

  it 'detects anagrams using case insensitive subject' do
    detector = Anagram.new('Orchestra')
    anagrams = detector.match(%w[cashregister carthorse radishes])
    expected = %w[carthorse]

    expect(anagrams).to eq(expected)
  end

  it 'detects anagrams using case insensitive possible matches' do
    detector = Anagram.new('orchestra')
    anagrams = detector.match(%w[cashregister Carthorse radishes])
    expected = %w[Carthorse]

    expect(anagrams).to eq(expected)
  end

  it 'does not detect an anagram if the original word is repeated' do
    detector = Anagram.new('go')
    anagrams = detector.match(%w[goGoGO])
    expected = %w[]

    expect(anagrams).to eq(expected)
  end

  it 'anagrams must use all letters exactly once' do
    detector = Anagram.new('tapper')
    anagrams = detector.match(%w[patter])
    expected = %w[]

    expect(anagrams).to eq(expected)
  end

  it 'words are not anagrams of themselves' do
    detector = Anagram.new('BANANA')
    anagrams = detector.match(%w[BANANA])
    expected = %w[]

    expect(anagrams).to eq(expected)
  end

  it 'words are not anagrams of themselves even if letter case is partially different' do
    detector = Anagram.new('BANANA')
    anagrams = detector.match(%w[Banana])
    expected = %w[]

    expect(anagrams).to eq(expected)
  end

  it 'words are not anagrams of themselves even if letter case is completely different' do
    detector = Anagram.new('BANANA')
    anagrams = detector.match(%w[banana])
    expected = %w[]

    expect(anagrams).to eq(expected)
  end

  it 'words other than themselves can be anagrams' do
    detector = Anagram.new('LISTEN')
    anagrams = detector.match(%w[LISTEN Silent])
    expected = %w[Silent]

    expect(anagrams).to eq(expected)
  end
end
