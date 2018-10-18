require 'pry'
class Phrase
  def initialize(phrase)
    @phrases = phrase.split(/[\s,]/)
                    .select { |word| word.match(/[a-zA-Z0-9]/) }
                    .map { |word| transform_word(word) }
  end

  def transform_word(word)
    word.gsub(/[^a-zA-Z0-9']|^'|'$/, '').downcase
  end

  def word_count
    counts = Hash.new(0)
    @phrases.each do |word|
      counts[word] += 1 if word.match(/[a-z0-9]/i)
    end
    counts
  end
end

phrase = Phrase.new("Joe can't tell between 'large' and large.")
p phrase.word_count
