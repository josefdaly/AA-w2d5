require 'rspec'
require_relative 'hand'
require_relative 'card'

class HandSpec

  describe 'initialize' do
    it 'creates a deck with the cards provided' do
      cards = [Card.new(:ace, :spades, 13), Card.new(:queen, :hearts, 11)]
      hand = Hand.new(cards)
      expect(hand.cards).to eq(cards)
    end
  end

  describe '#one_pair?' do
    context "when two card values are equal" do
      it 'returns true' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:queen, :hearts, 11),
                 Card.new(:ace, :hearts, 13),
                 Card.new(:king, :clubs, 12),
                 Card.new(:two, :diamonds, 1)]
        expect(Hand.new(cards).one_pair?).to eq(true)
      end
    end
    context "when no two card values are equal" do
      it 'returns false' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:queen, :hearts, 11),
                 Card.new(:three, :hearts, 2),
                 Card.new(:king, :clubs, 12),
                 Card.new(:two, :diamonds, 1)]
        expect(Hand.new(cards).one_pair?).to eq(false)
      end
    end
  end

  describe '#two_pair?' do
    context "when there is a pair of value pairs" do
      it 'returns true' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:queen, :hearts, 11),
                 Card.new(:ace, :hearts, 13),
                 Card.new(:queen, :clubs, 11),
                 Card.new(:two, :diamonds, 1)]
        expect(Hand.new(cards).two_pair?).to eq(true)
      end
    end
    context "when there is not a pair of value pairs" do
      it 'returns false' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:queen, :hearts, 11),
                 Card.new(:three, :hearts, 2),
                 Card.new(:king, :clubs, 12),
                 Card.new(:two, :diamonds, 1)]
        expect(Hand.new(cards).two_pair?).to eq(false)
      end
    end
  end

  describe '#three_of_a_kind?' do
    context "when there are three cards of equal value" do
      it 'returns true' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:ace, :clubs, 13),
                 Card.new(:ace, :hearts, 13),
                 Card.new(:queen, :clubs, 11),
                 Card.new(:two, :diamonds, 1)]
        expect(Hand.new(cards).three_of_a_kind?).to eq(true)
      end
    end
    context "when there are not three cards of equal value" do
      it 'returns false' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:queen, :hearts, 11),
                 Card.new(:three, :hearts, 2),
                 Card.new(:king, :clubs, 12),
                 Card.new(:two, :diamonds, 1)]
        expect(Hand.new(cards).three_of_a_kind?).to eq(false)
      end
    end
  end

  describe '#straight?' do
    context "when all five cards are in sequence by value" do
      it 'returns true' do
        cards = [Card.new(:two, :spades, 1),
                 Card.new(:three, :clubs, 2),
                 Card.new(:four, :hearts, 3),
                 Card.new(:five, :clubs, 4),
                 Card.new(:six, :diamonds, 5)]
        expect(Hand.new(cards).straight?).to eq(true)
      end
    end
    context "when all five cards are not in sequence" do
      it 'returns false' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:queen, :hearts, 11),
                 Card.new(:three, :hearts, 2),
                 Card.new(:king, :clubs, 12),
                 Card.new(:two, :diamonds, 1)]
        expect(Hand.new(cards).straight?).to eq(false)
      end
    end
    context "when sequence starts with an ace" do
      it 'returns true' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:two, :hearts, 1),
                 Card.new(:three, :hearts, 2),
                 Card.new(:four, :clubs, 3),
                 Card.new(:five, :diamonds, 4)]
        expect(Hand.new(cards).straight?).to eq(true)
      end
    end
    context "when sequence ends with an ace" do
      it 'returns true' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:king, :hearts, 12),
                 Card.new(:queen, :hearts, 11),
                 Card.new(:jack, :clubs, 10),
                 Card.new(:ten, :diamonds, 9)]
        expect(Hand.new(cards).straight?).to eq(true)
      end
    end
  end

  describe '#flush?' do
    context "when all five cards share the same suit" do
      it 'returns true' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:queen, :spades, 11),
                 Card.new(:three, :spades, 2),
                 Card.new(:king, :spades, 12),
                 Card.new(:two, :spades, 1)]
        expect(Hand.new(cards).flush?).to eq(true)
      end
    end
    context "when all five cards do not share the same suit" do
      it 'returns false' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:king, :hearts, 12),
                 Card.new(:queen, :hearts, 11),
                 Card.new(:jack, :clubs, 10),
                 Card.new(:ten, :diamonds, 9)]
        expect(Hand.new(cards).flush?).to eq(false)
      end
    end
  end

  describe '#full_house?' do
    context "when #two_pair && #three_of_a_kind are both true" do
      it 'returns true' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:ace, :clubs, 13),
                 Card.new(:ace, :hearts, 13),
                 Card.new(:queen, :clubs, 11),
                 Card.new(:queen, :diamonds, 11)]
        expect(Hand.new(cards).full_house?).to eq(true)
      end
    end
    context "when there is not a three of a kind and a pair" do
      it 'returns false' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:ace, :clubs, 13),
                 Card.new(:ace, :hearts, 13),
                 Card.new(:king, :clubs, 12),
                 Card.new(:queen, :diamonds, 11)]
        expect(Hand.new(cards).full_house?).to eq(false)
      end
    end
  end

  describe '#four_of_a_kind?' do
    context "when there are four cards of identical value" do
      it 'returns true' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:ace, :clubs, 13),
                 Card.new(:ace, :hearts, 13),
                 Card.new(:ace, :clubs, 13),
                 Card.new(:queen, :diamonds, 11)]
        expect(Hand.new(cards).four_of_a_kind?).to eq(true)
      end
    end
    context "when there are not four cards of identical value" do
      it 'returns false' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:ace, :clubs, 13),
                 Card.new(:ace, :hearts, 13),
                 Card.new(:king, :clubs, 12),
                 Card.new(:queen, :diamonds, 11)]
        expect(Hand.new(cards).four_of_a_kind?).to eq(false)
      end
    end
  end

  describe '#straight_flush?' do
    context 'when there is a straight and a flush' do
      it 'returns true' do
        cards = [Card.new(:two, :spades, 1),
                 Card.new(:three, :spades, 2),
                 Card.new(:four, :spades, 3),
                 Card.new(:five, :spades, 4),
                 Card.new(:six, :spades, 5)]
        expect(Hand.new(cards).straight_flush?).to eq(true)
      end
    end
    context 'when there is a straight, but not a flush' do
      it 'returns false' do
        cards = [Card.new(:two, :spades, 1),
                 Card.new(:three, :clubs, 2),
                 Card.new(:four, :hearts, 3),
                 Card.new(:five, :clubs, 4),
                 Card.new(:six, :diamonds, 5)]
        expect(Hand.new(cards).straight_flush?).to eq(false)
      end
    end
    context 'when there is a flush, but not a straight' do
      it 'returns false' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:queen, :spades, 11),
                 Card.new(:three, :spades, 2),
                 Card.new(:king, :spades, 12),
                 Card.new(:two, :spades, 1)]
        expect(Hand.new(cards).straight_flush?).to eq(false)
      end
    end
    context 'when there is neither a straight, nor a flush' do
      it 'returns false' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:ace, :clubs, 13),
                 Card.new(:ace, :hearts, 13),
                 Card.new(:king, :clubs, 12),
                 Card.new(:queen, :diamonds, 11)]
        expect(Hand.new(cards).straight_flush?).to eq(false)
      end
    end
  end

  describe '#royal_flush' do
    context 'when there is a flush and a straight involving the five highest cards' do
      it 'returns true' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:king, :spades, 12),
                 Card.new(:queen, :spades, 11),
                 Card.new(:jack, :spades, 10),
                 Card.new(:ten, :spades, 9)]
        expect(Hand.new(cards).royal_flush?).to eq(true)
      end
    end
    context 'when there is a striaght of the 5 highest cards but no flush' do
      it 'returns false' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:king, :clubs, 12),
                 Card.new(:queen, :hearts, 11),
                 Card.new(:jack, :spades, 10),
                 Card.new(:ten, :spades, 9)]
        expect(Hand.new(cards).royal_flush?).to eq(false)
      end
    end
    context 'when there is a flush and a lower straight' do
      it 'returns false' do
        cards = [Card.new(:two, :spades, 1),
                 Card.new(:three, :spades, 2),
                 Card.new(:four, :spades, 3),
                 Card.new(:five, :spades, 4),
                 Card.new(:six, :spades, 5)]
        expect(Hand.new(cards).royal_flush?).to eq(false)
      end
    end
    context 'when no conditions are satisfied' do
      it 'returns false' do
        cards = [Card.new(:ace, :spades, 13),
                 Card.new(:two, :clubs, 1),
                 Card.new(:queen, :hearts, 11),
                 Card.new(:jack, :spades, 10),
                 Card.new(:ten, :spades, 9)]
        expect(Hand.new(cards).royal_flush?).to eq(false)
      end
    end
  end

  describe '#better_hand?' do
    context 'when self is a stronger hand than argument' do
      it 'returns true' do
        #royal_flush
        cards_one = [Card.new(:ace, :spades, 13),
                     Card.new(:king, :spades, 12),
                     Card.new(:queen, :spades, 11),
                     Card.new(:jack, :spades, 10),
                     Card.new(:ten, :spades, 9)]
        #nothing
        cards_two = [Card.new(:ace, :spades, 13),
                     Card.new(:two, :clubs, 1),
                     Card.new(:queen, :hearts, 11),
                     Card.new(:jack, :spades, 10),
                     Card.new(:ten, :spades, 9)]

        hand_one = Hand.new(cards_one)
        hand_two = Hand.new(cards_two)
        expect(hand_one.better_hand?(hand_two)).to eq(true)
      end
    end
  end
end
