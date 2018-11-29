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

  def take_turn(turn)
    @turns << turn
    @turns.last
  end

  def number_correct
    @turns.count
  end

end
