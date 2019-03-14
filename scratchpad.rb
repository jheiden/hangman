


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





class Word

  attr_accessor :wordbook

  def initialize
    @wordbook = filter_words(File.read("5desk.txt"))

  end

  def filter_words(str)
    return str.split(" ").select{|word| word.length >= 5 && word.length <= 12}
  end

  def random_word()
    return @wordbook[rand(wordbook.length - 1)].downcase
  end


end






p out_of_guesses?(2, 2)