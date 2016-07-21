class Card
  SUIT_UNICODE = {
    spade: "\u2660",
    heart: "\u2665",
    diamond: "\u2666",
    club: "\u2663"
  }

  attr_reader :value, :suit
  
  def initialize(suit, value)
      @value = value
      @suit = suit
  end

  def to_s
    "#{SUIT_UNICODE[@suit]}#{@value.to_s}"
  end
end
