
class WordHandling

  attr_accessor :wordbook, :the_word, :guessed_letters

  def initialize
    @wordbook = filter_words(File.read("5desk.txt"))
    @the_word = random_word() 
    @guessed_letters = []
  end

  def filter_words(str)
    return str.split(" ").select{|word| word.length >= 5 && word.length <= 12}
  end

  def random_word
    # need to write to file
    return @wordbook[rand(wordbook.length - 1)].downcase
  end

  def return_length
    return @the_word.length
  end

  def add_guessed_letter (letter)
    @guessed_letters << letter
    
  end

  def display_status ()
    # need to read from file and display ---X-X to user

  end

  


end

class Serialize
  # Handles saving of state.. serialization .. 
  def initialize
    
  end

  def read_from_file(data_to_read)

  end

  def write_to_file(data_to_write)
    # When using the File block statement the file is automatically closed
    File.open(@file, 'w') do |file|
      file.puts YAML.dump(data_to_write)
    end
  end

end


class GameLogic
  
  def initialize()
    @wordhandling = WordHandling.new
    @serialize = Serialize.new
    @max_guesses = 8
    @count_guesses = 0
    
  end

  def get_user_guess
    puts "Guess a letter"
    return gets.chomp.downcase
    # send guessed letter to other class to validate if guess was correct.
    get_user_guess()
  end

  def correct_guess? (the_word, letter)
    # take input character and match it against each character in @wordhandling.the_word
  end

  def game_over?
    out_of_guesses? || correct_word?
  end

  def out_of_guesses?
    return true if @count_guesses == 8
  end
  
  def correct_word?
    #return true if ..
    
  end

end

mygame = GameLogic.new
