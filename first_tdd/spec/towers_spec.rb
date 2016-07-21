require 'rspec'
require 'towers'

describe Towers do
  subject(:game) {Towers.new}

  describe "#initialize" do
    it "initializes with 3 discs in one tower in the correct order" do
      expect(game.towers).to eq([[1,2,3], [],[]])
    end

  end

  describe "#valid_input?" do
    let(:valid_input) {"0,1"}
    let(:invalid1)  {"01"}
    let(:invalid2)  {"0,5"}
    let(:invalid3)  {"0,0"}
    let(:invalid4)  {"1,0"}

    it "accepts a valid input" do
      expect(game.valid_input?(valid_input)).to be_truthy
    end

    it "doesn't accept an input without a comma" do
      expect(game.valid_input?(invalid1)).to be(false)
    end

    it "doesn't accept an input that is out of range" do
      expect(game.valid_input?(invalid2)).to be(false)
    end

    it "doesn't accept two of the same positions" do
      expect(game.valid_input?(invalid3)).to be(false)
    end

    it "doesn't accpet a start position that doesn't have any discs" do
      expect(game.valid_input?(invalid4)).to be(false)
    end
  end

  describe "#move_disc" do
    before(:each) do
      game.move_disc([0,1])
    end

    it "actually moves a disc" do
      expect(game.towers). to eq([[2,3], [1], []])
    end

    it "raises an error if you try to move a bigger disc onto a smaller disc" do
      expect{game.move_disc([0,1])}.to raise_error(StandardError)
    end

    it "won't move a bigger disc on to a smaller disc"
  end

  describe "#won?" do

    it "returns false when the game is not won" do
      expect(game.won?).to be(false)
    end

    context "the board is in a winning state" do
      before(:each) do
        game.move_disc([0,2])
        game.move_disc([0,1])
        game.move_disc([2,1])
        game.move_disc([0,2])
        game.move_disc([1,0])
        game.move_disc([1,2])
        game.move_disc([0,2])
      end

      it "returns true if the game is won" do
        expect(game.won?).to be(true)
      end
    end
  end
end
