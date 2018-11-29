class Turn

  attr_accessor :card,
                :guess

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end

end
