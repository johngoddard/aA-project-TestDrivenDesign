require 'rspec'
require 'deck'

describe Deck do
  subject(:deck){Deck.new}

  describe "#initialize" do
    it "creates a deck with 52 cards" do
      expect(deck.cards.size).to eq(52)
    end

    it "creates a deck with unique 52 cards" do
      card_strings = deck.cards.map{|card| card.to_s}
      expect(card_strings.size).to eq(52)
    end

    context "if there are 52 cards, check they are the right value and suit" do

      let(:cards_by_suit){
        [deck.cards.select{|card| card.suit == :spade},
        deck.cards.select{|card| card.suit == :heart},
        deck.cards.select{|card| card.suit == :club},
        deck.cards.select{|card| card.suit == :diamond}]
      }

      it "creates 13 unique cards for each suit" do
        expect(cards_by_suit.all?{|suit| suit.size == 13}).to be(true)
      end

      it "creates cards with the right values for each suit" do
        vals = cards_by_suit.each{|suit| suit.map!{|card| card.value}}
        expect(vals.all?{|suit_vals| suit_vals.sort == (2..14).to_a}).to be(true)
      end
    end
  end

  describe "#shuffle_deck!" do
    # let(:unshuffled){Deck.new.cards}
    let(:shuffled){Deck.new}

    before(:each) do
      shuffled.shuffle_deck!
    end

    it "should permanently shuffle the deck" do
      cards = shuffled.cards
      expect(cards[0..12].any?{|card| card.suit != :spade}).to be(true)
    end
  end

  describe "#get_next_card" do
    it "returns a Card object" do
      expect(deck.get_next_card.is_a?(Card)).to be(true)
    end

    it "raises an error if the deck is empty" do
      expect{53.times{deck.get_next_card}}.to raise_error(StandardError)
    end

    it "removes the card from the deck" do
      deck.get_next_card
      expect(deck.cards.size).to eq(51)
    end

  end
end
