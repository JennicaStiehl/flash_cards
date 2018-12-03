class Turn

  attr_reader :card,
              :guess

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @card.answer.class == Integer
      @guess.to_i == @card.answer.to_i
    else
      @guess == @card.answer
    end
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end
