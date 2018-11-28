class Round

  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.last
  end

  def take_turn(guess)
    @turns.guess = guess
  end
end
