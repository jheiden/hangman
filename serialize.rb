require 'json'


class Serialize

  def save (random_word, guesses, correct_guesses, count_guesses, max_guesses)
    json_obj = JSON.dump({
      :word => random_word,
      :guesses => guesses,
      :correct_guesses => correct_guesses,
      :count_guesses => count_guesses,
      :max_guesses => max_guesses
    })

    File.open('gamestate.json', 'w') do |file|
      file.write(json_obj)
    end
  end

  def load()

  end

end