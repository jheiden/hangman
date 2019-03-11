
class WordHandling

  attr_accessor :wordbook, :the_word

  def initialize
    @wordbook = filter_words(File.read("5desk.txt"))
    @the_word = random_word() # move to Serialize
    @guessed_letters = []
    
  end

  def filter_words(str)
    return str.split(" ").select{|word| word.length >= 5 && word.length <= 12}
  end

  def random_word
    return @wordbook[rand(wordbook.length - 1)]
  end

  def return_length
    return @the_word.length
  
  end

end

class Interface
  # Communicates with user

  def initialize()
    @wordhandling = WordHandling.new
  end

  def 



  def display_status ()
    
  end


end


class Serialize
  # Handles saving of state.. serialization .. 

  def initialize
    @WordHandling = WordHandling.new
    

  end

  def read_from_file

  end


  def write_to_file
    File.open("gamestate.txt", 'w') do |file|
      for i in 1..@WordHandling.return_length
        file.print("_ ")
      end
    end
  end


end


class GameLogic
  
  def initialize()
    @wordhandling = WordHandling.new
    @interface = Interface.new
    @serialize = Serialize.new
    @count_guesses = 0
    
  end

  def correct_guess?
    # take input character and match it against characters in @wordhandling.the_word

  end



  def game_over?
    out_of_guesses? || correct_word?
  end

  def out_of_guesses?
    return true if @count_guesses == 8
  end
  
  def correct_word?
    return true if 
    # return true if @wordhandling.guessed_letters = @the_word
  end

end



mygame = GameLogic.new
