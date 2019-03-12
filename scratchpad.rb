


require 'yaml'

class Serialize 

  def initialize
    @the_word = []
    @file = 'gamestate.yaml'
  end

  def read_from_file() # add parameter? or doesnt make sense since only 1 file in program.
    thing = YAML.load_file('gamestate.yaml')
    p thing.inspect

  end

  def write_to_file(data_to_write)
    # When using the File block statement the file is automatically closed
    File.open(@file, 'w') do |file|
      file.puts YAML.dump(data_to_write)
    end
  end

  def get_input
    @the_word = gets.chomp
    write_to_file(@the_word)
    read_from_file()
  end

end

serializer = Serialize.new
serializer.get_input


# def get_user_guess
#   puts "Guess a letter"
#   guess = gets.chomp.downcase
#   return "String value : #{guess[0]} recieved" if guess =~ /[a-z]/
#   # send guessed letter to other class to validate if guess was correct.
#   puts "Must be a character between a-z"
#   get_user_guess()
# end

# puts get_user_guess()