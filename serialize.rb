require 'json'



class Serialize

  attr_accessor :json_obj

    def initialize
      @json_obj = ""

    end

  def save (random_word, guesses, correct_guesses, count_guesses, max_guesses)
    json_obj = JSON.dump({
      :the_word => random_word,
      :guesses => guesses,
      :correct_guesses => correct_guesses,
      :count_guesses => count_guesses,
      :max_guesses => max_guesses
    })

    File.open('gamestate.json', 'w') do |file|
      file.write(json_obj)
    end
  end

  def return_json_obj()
    @json_obj = File.read('gamestate.json')
    return JSON.load(@json_obj)
    # send data back to caller and destructure object there.2
  end

end