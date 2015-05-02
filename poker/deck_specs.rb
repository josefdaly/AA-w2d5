require 'rspec'
require_relative 'deck'
require_relative 'card'

describe Deck do
  # subject(:deck) { Deck.new }

  describe 'initialize' do
    it 'creates a deck with the cards provided' do
      cards = [Card.new(:ace, :spades, 13), Card.new(:queen, :hearts, 11)]
      deck = Deck.new(cards)
      expect(deck.cards).to eq(cards)
    end
  end

  describe 'Deck::generate_full_deck' do
    context 'it correctly generates a 52 card deck' do
      subject(:deck) { Deck.generate_full_deck }
      it 'is 52 cards in length' do
        expect(deck.cards.length).to eq(52)
      end
      it 'creates a deck of unique cards' do
        expect(deck.cards.uniq.length).to eq(deck.cards.length)
      end
    end
  end
end
