require_relative 'card'

class Deck
  SUITS = [:clubs, :diamonds, :hearts, :spades]
  NAME_VALUE_PAIRS = [[:ace, 13],
                      [:two, 1],
                      [:three, 2],
                      [:four, 3],
                      [:five, 4],
                      [:six, 5],
                      [:seven, 6],
                      [:eight, 7],
                      [:nine, 8],
                      [:ten, 9],
                      [:jack, 10],
                      [:queen, 11],
                      [:king, 12]]

  attr_accessor :cards

  def self.generate_full_deck
    cards = []
    NAME_VALUE_PAIRS.each do |pair|
      SUITS.each do |suit|
        cards << Card.new(pair.first, suit, pair.last)
      end
    end

    Deck.new(cards)
  end

  def initialize(cards)
    @cards = cards
  end
end
