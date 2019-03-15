
require 'json'
class Word

  attr_accessor :wordbook, :the_word, :my_obj, :name

  def initialize
    @wordbook = filter_words(File.read("5desk.txt"))
    @the_word = random_word()
    @correct_guesses = ["a", "b", "c"]
    @all_guesses =  ["a", "b", "c", "d"]
    @name = "Pat"
    
    save()
    load()
  end

  def filter_words(str)
    return str.split(" ").select{|word| word.length >= 5 && word.length <= 12}
  end

  def random_word()
    return @wordbook[rand(wordbook.length - 1)].downcase
  end

    def save()
      json = JSON.dump({
        :randoword => @the_word,
        :correct_guesses => @correct_guesses
      })   
      File.open('gamestate.json', 'w') do |file|
        file.write(json)
      end
    end

    def load
      data = File.read("gamestate.json") 
      data = JSON.load(data)
      @name = data["word"]
      puts @name
      end
      
    def puts_name
      puts @name

    end

end

class Toad

  def initialize
    @word = Word.new
  end

  def change 
    @word.name = "Toady"
    @word.puts_name
  end


end

k = Word.new
m = Toad.new

m.change()





# require 'yaml'

# class Serialize 

#   def initialize
#     @the_word = []
#     @file = 'gamestate.yaml'
#   end

#   def read_from_file() # add parameter? or doesnt make sense since only 1 file in program.
#     thing = YAML.load_file('gamestate.yaml')
#     p thing.inspect

#   end

#   def write_to_file(data_to_write)
#     # When using the File block statement the file is automatically closed
#     File.open(@file, 'w') do |file|
#       file.puts YAML.dump(data_to_write)
#     end
#   end

#   def get_input
#     @the_word = gets.chomp
#     write_to_file(@the_word)
#     read_from_file()
#   end

# end

# serializer = Serialize.new
# serializer.get_input



