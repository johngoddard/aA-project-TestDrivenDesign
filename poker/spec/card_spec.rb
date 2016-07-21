require 'rspec'
require 'card'

describe Card do
  subject(:card){Card.new(:spade, 5)}

  describe "#initialize" do
    it "initializes with a value" do
      expect(card.value).to eq(5)
    end

    it "initializes with a suit" do
      expect(card.suit).to eq(:spade)
    end
  end


  describe "#to_s" do
    it "converts suit and value to a string" do
      spade = "\u2660"
      expect(card.to_s).to eq("#{spade.encode('utf-8')}5")
    end
  end
  # describe "#<=>" do
  #   let(:smaller_card){Card.new(:heart, 3)}
  #   let(:bigger_card){Card.new(:heart, 9)}
  #   let(:equal_card){Card.new(:club, 5)}
  #
  #   it "returns "
  # end


end
