
# Write method that tests if 

class Game

  attr_accessor :the_word, :guesses

  def initialize
    @rules = Rules.new
    @word = Word.new
    
    @the_word = @word.random_word() 
    @guesses = ["a"]
    @correct_guesses = []

    @count_guesses = 0
    @max_guesses = 8

    
    
  end

  def get_user_guess
    puts "Guess a letter"
    guess = gets.chomp.downcase
    if guess[0] =~ /[a-z]/
      add_to_guesses(guess[0]) # if not guessed_before?
    else
      puts "Must be a character between a-z"
      get_user_guess()
    end
  end

  def add_to_guesses letter
    if @rules.guessed_before?(@guesses, letter)
      puts "Character #{letter} has already been guessed before, try again!"
      get_user_guess()
    else   
      @guesses << letter
    end
  end

end

class Word

  attr_accessor :wordbook

  def initialize
    @wordbook = filter_words(File.read("5desk.txt"))
  end

  def filter_words(str)
    return str.split(" ").select{|word| word.length >= 5 && word.length <= 12}
  end

  def random_word
    return @wordbook[rand(wordbook.length - 1)].downcase
  end


end

class Rules

  def guessed_before?(guesses_arr, letter)
    return guesses_arr.include?(letter)
  end


end



k = Game.new