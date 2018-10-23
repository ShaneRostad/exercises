# Rules of Pig Latin:
# 1 - if a word begins with a vowel sound, add an "ay" sound to the end of the word
# 2 - if a word begins with a consonant sound, move it to the end of the word, then add an "ay" sound to the end of the word.


class PigLatin
  def self.translate(phrase)
    translated = phrase.split(' ').map do |word|
      if word.match(/^[aeiou]/)
        word << 'ay'
      elsif word.match?(/(^yt|^xr)/)
        word << 'ay'
      elsif word.match?(/^[pkfryx]/)
        word.partition(/^[pkfryx]/).reverse.join('') << 'ay'
      elsif word.match?(/^(ch|[^aeiou]?qu|thr?|sch)/)
        word.partition(/^(ch|[^aeiou]?qu|thr?|sch)/)
        .reverse.join('') << 'ay'
      end
    end
    translated.join(' ')
  end
end

p PigLatin.translate('xray')
