require_relative "card"

class Hand
  HAND_VALUES = {

  }
  attr_reader :hand_cards

  def initialize
    @hand_cards = []
  end

  def add_card(card)
    @hand_cards << card
  end

  def remove_card!(suit, value)
    @hand_cards.delete_if do |card|
      card.suit == suit && card.value == value
    end
  end

end
