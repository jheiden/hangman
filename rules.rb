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

  def out_of_guesses? (guess_count, guess_max)
    return guess_count == guess_max
  end

  def correct_word? (guessed_word)  
    !guessed_word.include?("_")
  end

end