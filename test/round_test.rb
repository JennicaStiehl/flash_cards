require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/round'
require './lib/turn'

class RoundTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_it_has_a_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_it_has_turns
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_equal [], round.turns
  end

  def test_it_has_a_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  def test_it_can_take_a_turn
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
    assert_equal "Juneau", new_turn.guess
    assert_equal card_1, new_turn.card
  end

  def test_the_new_turns_guess_is_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_equal true, new_turn.correct?
  end

  def test_it_holds_the_new_turn
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    turn = Turn.new("Juneau", card_1)
    new_turn = round.take_turn("Juneau")

    assert_equal [new_turn], round.turns
  end

  def test_it_knows_number_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_equal 1, round.number_correct
  end

  def test_it_knows_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_turn_1 = round.take_turn("Juneau")
    # new_turn_2 = round.take_turn("Mars")

    assert_equal card_2, round.current_card
  end

  def test_it_creates_a_new_turn
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_equal Turn, new_turn.class #, round.take_turn("North north west")
    #=> #<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">
  end

  def test_it_can_count_turns
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    new_turn_2 = round.take_turn("Mars")

    assert_equal 2, round.turns.count
  end

  def test_it_can_give_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_turn = round.take_turn("Mars")

    assert_equal "Incorrect.", round.turns.last.feedback
  end

  def test_it_can_count_number_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_equal 1, round.number_correct
  end

  def test_it_can_get_correct_number_by_category
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_turn_1 = round.take_turn("Juneau")
    new_turn_2 = round.take_turn("Mars")
# binding.pry
    assert_equal 1, round.number_correct_by_category(:Geography)
  end

  def test_it_can_get_correct_number_by_diff_category
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_turn_1 = round.take_turn("Juneau")
# binding.pry
    assert_equal 0, round.number_correct_by_category(:STEM)
  end

  def test_it_can_get_percent_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_turn_1 = round.take_turn("Juneau")
    new_turn_2 = round.take_turn("Juneau")

    assert_equal 50.0, round.percent_correct
    #=> 50.0
  end

  def test_it_can_percent_correct_by_category
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    new_turn_1 = round.take_turn("Juneau")
    new_turn_2 = round.take_turn("Mars")
    assert_equal 100, round.percent_correct_by_category(:Geography)
    #=> 100.0
  end

  def test_it_can_get_the_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn_1 = round.take_turn("Juneau")
    new_turn_2 = round.take_turn("Mars")

    assert_equal card_3, round.current_card
    #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
  end
end
