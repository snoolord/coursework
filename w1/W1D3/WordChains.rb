require 'set'
class WordChainer
  def initialize
    lines = File.readlines(ARGV[0]).map {|line| line.chomp}
    @dictionary = Set.new(lines)
  end

  def adjacent_words(word)
    adj_words = []
    @dictionary.each do |wrd|
      adj_words << wrd if wrd.length == word.length && adj_match?(wrd,word)
    end
    p adj_words
  end

  def adj_match?(word1,word2)
    counter =0
    (0...word1.length).each do |index|
      counter +=1 if word1[index] == word2[index]
    end
    counter == word1.length-1
  end
end

if __FILE__ == $PROGRAM_NAME
  word_chainer = WordChainer.new
  word_chainer.adjacent_words("bat")
end
