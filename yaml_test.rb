require 'yaml'
# writing to file 

# @preferences = {"word-wrapping" => true, "font-size" => 20, "font" => "arial"}

# output = File.new("pref.yaml", 'w')
# output.puts(YAML.dump(@preferences))
# output.close


# reading from file

# output = File.new('pref.yaml', 'r')
# @preferences = YAML.load(output.read)
# output.close

# puts @preferences.inspect


class Person

  def initialize name
    @name = name
  end
end

tom = Person.new("Tommy")
output = File.new("pref.yaml", 'w')
output.puts(YAML.dump(tom))
output.close

