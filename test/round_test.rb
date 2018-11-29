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

    assert_equal card_3, round.current_card
  end

  def test_it_can_take_a_turn
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    turn = Turn.new("Juneau", card_1)
    new_turn = round.take_turn(turn)

    assert_equal turn, new_turn
  end

  def test_it_creates_a_new_turn
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    turn = Turn.new("Juneau", card_1)
    new_turn = round.take_turn(turn)

    assert_equal Turn, new_turn.class
  end

  def test_the_new_turns_guess_is_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    turn = Turn.new("Juneau", card_1)
    new_turn = round.take_turn(turn)

    assert_equal true, new_turn.correct?
  end

  def test_it_holds_the_new_turn
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    turn = Turn.new("Juneau", card_1)
    new_turn = round.take_turn(turn)

    assert_equal [turn], round.turns
  end

  def test_it_knows_number_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    turn = Turn.new("Juneau", card_1)
    new_turn = round.take_turn(turn)

    assert_equal 1, round.number_correct
  end

  def test_it_knows_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    turn = Turn.new("Juneau", card_1)
    turn_2 = Turn.new("Mars", card_2)
    new_turn_1 = round.take_turn(turn)
    new_turn_2 = round.take_turn(turn_2)

    assert_equal card_2, round.current_card
  end

  def test_it_creates_a_new_turn
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    turn = Turn.new("Juneau", card_1)
    turn_2 = Turn.new("Mars", card_2)
    turn_3 = Turn.new("Venus", card_3)
    new_turn = round.take_turn(turn)
    new_turn_2 = round.take_turn(turn_2)
    new_turn_3 = round.take_turn(turn_3)

    assert_equal turn_3, round.take_turn(turn_3)
  end

  def test_it_can_count_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    turn = Turn.new("Juneau", card_1)
    turn_2 = Turn.new("Mars", card_2)
    new_turn = round.take_turn(turn)
    new_turn_2 = round.take_turn(turn_2)

    assert_equal 2, round.guesses.count
  end

  def test_skip
    skip
    round.guesses.last.feedback
    #=> "Incorrect."

    round.number_correct
    #=> 1

    round.number_correct_by_category(:Geography)
    #=> 1

    round.number_correct_by_category(:STEM)
    #=> 0

    round.percent_correct
    #=> 50.0

    round.percent_correct_by_category(:Geography)
    #=> 100.0

    round.current_card
    #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
  end
end
