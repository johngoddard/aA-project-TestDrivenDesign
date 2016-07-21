require 'rspec'
require 'hand'

describe Hand do
  subject(:hand){Hand.new}

  describe "#initialize" do
    it "creates an empty array for hand cards" do
      expect(hand.hand_cards).to eq([])
    end
  end

  describe "#add_card" do
    before(:each) do
      card = Card.new(:spade, 3)
      hand.add_card(card)
    end

    it "adds a card object to hand cards" do
      expect(hand.hand_cards.first.is_a?(Card)).to be(true)
    end

    it "adds one card to hand cards" do
      expect(hand.hand_cards.size).to eq(1)
    end
  end

  describe "#remove_card!" do
    before(:each) do
      card1 = Card.new(:spade, 3)
      card2 = Card.new(:club, 3)
      hand.add_card(card1)
      hand.add_card(card2)
      hand.remove_card!(:spade, 3)
    end

    it "should reduce the hand size by one" do
      expect(hand.hand_cards.size).to eq(1)
    end

    it "removes the right card" do
      expect(hand.hand_cards.first.suit).to eq(:club)
    end
  end

end


# /// player
# def first_hand
#   five_cards = []
#   5.times do
#     five_cards << deck.get_next_card
#   end
#
#   Hand.new(five_cards)
# end
#
# def initializes
#   @cards = []
# end
#
# def first_hand
#   @hand.empty_hand
#
#   5.times do
#     @hand.add_card(deck.get_next_card)
#   end
#
# end
