class Deck

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category_name)
    @cards.select { |card| card.category == category_name }
  end

end
