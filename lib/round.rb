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
    # @deck.cards.last
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    total = 0
    @turns.each do |turn|
      # binding.pry
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
          # @values << turn.card
          counter += 1
        end
      end
    # binding.pry
    counter
  end

  def number_by_category(category)
    counter = 0
    @turns.each do |turn|
      if turn.card.category == category
        counter += 1
      end
      # binding.pry
    end
    counter
  end

  def percent_correct
    ((self.number_correct * 1.0) / self.count) * 100
  end

  def percent_correct_by_category(category)
    correct = number_correct_by_category(category)
    # binding.pry
    # count = number_by_category(category)
    ((correct * 1.0) / number_by_category(category).to_f ) * 100
  end

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
    puts "You had #{number_correct} out of #{count}."
    results = {}
    counter
    @turns.map do |turn|
      # binding.pry
      category = turn.card.category
      number_by_category(category)
      puts "#{category} - #{(percent_correct_by_category(category)).to_i} % correct"

    end
  end


end
