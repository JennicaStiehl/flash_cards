require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_it_exists
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  assert_instance_of Card, card
  end

  def test_it
  turn = Turn.new("Juneau", card)
  #=> #<Turn:0x00007f99842f0998 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @guess="Juneau">
  end

  def test_it
  skip
  turn.card
  #=> #<Card:0x00007f800e29f0c8 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>
  end

  def test_it
    skip
  turn.guess
  #=> "Juneau"
  end

  def test_it
    skip
  turn.correct?
  #=> true
  end

  def test_it
    skip
  turn.feedback
  #=> "Correct!"
  end

end
