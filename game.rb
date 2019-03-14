require_relative 'word.rb'
require_relative 'rules.rb'

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

    display_status() # start game loop
  end

  def display_status
    print "#{@correct_guesses}\n \n"
    puts "Remaining guesses : #{@max_guesses - @count_guesses}\n\n"
    get_user_guess()
  end

  def no_guesses_left
    puts "Out of guesses, the correct word was #{@the_word}"
    exit
  end

  def victory
    puts "You win"
    exit
  end

  def get_user_guess
    if @rules.out_of_guesses?(@count_guesses, @max_guesses)
      no_guesses_left()
    end
    
    if @rules.correct_word?(@correct_guesses)
      victory()
    end
    
    puts "Guess a letter\n"
    guess = gets.chomp.downcase
    if guess[0] =~ /[a-z]/
      add_to_guesses(guess[0]) 
      add_to_correct_guesses(guess)
    else
      puts "Must be a character between a-z"
      get_user_guess()
    end
    increment_guess_count()
    display_status()
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
    arr.fill("_", 0..@the_word.length - 1)
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
  
    end

    def increment_guess_count
      @count_guesses += 1
    end

end

k = Game.new


