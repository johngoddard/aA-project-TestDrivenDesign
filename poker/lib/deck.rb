require_relative 'card'

class Deck
  SUITS = [:spade, :heart, :club, :diamond]
  VALUES = (2..14).to_a

  attr_reader :cards

  def initialize
    new_deck
  end

  def shuffle_deck!
    @cards.shuffle!
  end

  def new_deck
    @cards = []

    SUITS.each do |suit|
      VALUES.each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end

  def get_next_card
    raise "No cards left" if @cards.empty?
    @cards.shift
  end

end
