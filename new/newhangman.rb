
# Write method that tests if @the_word includes guess 
# (but need to use each with index and store index of each match to insert correct guess to position)

class Game

  attr_accessor :the_word, :guesses

  def initialize
    
    @rules = Rules.new
    @word = Word.new
    
    @the_word = @word.random_word() 
    @guesses = []
    @correct_guesses = create_guess_array()
   
    @count_guesses = 0
    @max_guesses = 8

  end

  def get_user_guess
    puts "Guess a letter"
    guess = gets.chomp.downcase
    if guess[0] =~ /[a-z]/
      add_to_guesses(guess[0]) 
      add_to_correct_guesses(guess)
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

  def create_guess_array 
    arr = []
    i = 0
    for i in 0..@the_word.length - 1 do 
      i = "_"
      arr << i 
    end
   return arr
  end

  def add_to_correct_guesses letter
    index_array = @rules.correct_guess?(@the_word, letter)
    if index_array.length == 0
      puts "incorrect guess"
    else
      index_array.each do |item|
        @correct_guesses[item] = letter
    end
      end
        puts index_array
        puts @correct_guesses
        puts @the_word
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
  
  def correct_guess?(word, letter)
    newarr = []
    word.split("").each_with_index do |item, index|
      if item == letter
        newarr << index
    end
      end
      return newarr
  end

end

k = Game.new
m = Rules.new

