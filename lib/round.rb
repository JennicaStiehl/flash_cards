require 'pry'

class Round
  attr_reader :deck,
              :turns,
              :values

  def initialize(deck)
    @deck = deck
    @turns = []
    @values = []


  end

  def current_card
    @deck.cards[(self.count)]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    total = 0
    @turns.each do |turn|
      if turn.correct?
        total += 1
      end
    end
    total
  end

  def count
    @turns.count
  end

  def number_correct_by_category(category)
    counter = 0
    @turns.each do |turn|
        if turn.correct? && turn.card.category == category
          counter += 1
        end
      end
    counter
  end

  def number_by_category(category)
    counter = 0
    @turns.each do |turn|
      if turn.card.category == category
        counter += 1
      end
    end
      counter #hsh #
  end

  def percent_correct
    ((self.number_correct * 1.0) / self.count) * 100
  end

  def percent_correct_by_category(category)
    correct = number_correct_by_category(category)
    # new_correct = correct.sum
    total = number_by_category(category)
    # new_total = total.sum
    (correct / total.to_f ) * 100
  end

  # def unique_categories
  #   uniq_cat = []
  #   @turns.each do |turn|
  #     uniq_cat << turn.card.category
  #   end
  #   uniq_cat.uniq
  # end


  def start
    puts " "
    puts "Welcome! You're playing with 4 cards."
    puts "-------------------------------------------------"

    counter = 0
    4.times do
      counter += 1
      puts " "
      puts "This is card number #{counter} out of 4."
      puts current_card.question
      new_turn = take_turn(gets.chomp)
      new_turn.correct?
      puts new_turn.feedback
    end
    puts "****** Game over! ******"
    puts "You had #{number_correct} out of #{count} for a total score of #{percent_correct.round}%."
    # unique_categories
    output = []
    @turns.each do |turn|
      # binding.pry
      category = turn.card.category
      output << "#{category} - #{(percent_correct_by_category(category))} % correct"
    end
    puts output
  end


end
