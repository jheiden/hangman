class Word

  attr_accessor :wordbook

  def initialize
    @wordbook = filter_words(File.read("data/5desk.txt"))
  end

  def filter_words(str)
    return str.split(" ").select{|word| word.length >= 5 && word.length <= 8}
  end

  def random_word
    return @wordbook[rand(wordbook.length - 1)].downcase
  end

end
