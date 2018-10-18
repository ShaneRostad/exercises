# we can split the input string into an array and sort it, split the test strings and sort them, then add any test string that == our split input string into a new array.

class Anagram
  def initialize(word)
    @input_word = word
  end

  def is_anagram?(word)
    word.downcase.chars.sort == @input_word.downcase.chars.sort &&
    word.downcase != @input_word.downcase
  end

  def match(compare_array)
    output = []
    compare_array.select { |word| output << word if is_anagram?(word) }
  end
end

detector = Anagram.new('Orchestra')
p detector.match %w(cashregister Carthorse radishes)
