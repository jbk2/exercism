=begin
Write your code for the 'Anagram' exercise in this file. Make the tests in
`anagram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/anagram` directory.
=end

class Anagram
  def initialize(word)
    @word = word.downcase
    @char_map = map_chars(@word)
  end
  
  def match(words_array)
    matches = []
    
    words_array.each do |match_word|
      next if @word == match_word.downcase
      match_word_map = map_chars(match_word.downcase)

      matches << match_word if @char_map == match_word_map
    end

    matches
  end

  private
  def map_chars(word)
    map = Hash.new { |h, k| h[k] = 0 }
    word.each_char { |char| map[char] += 1 }
    map
  end

end