require 'rspec'
require_relative 'towers_of_hanoi'

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }
  describe '#render' do
    context 'Correctly renders the game' do
      it 'displays the starting board' do
        expect(TowersOfHanoi.new.render).to eq([[3, 2, 1], [], []])
      end

      it 'displays the ending board' do
        game.first_tower = []
        game.second_tower = []
        game.third_tower = [3, 2, 1]
        expect(game.render).to eq([[], [], [3, 2, 1]])
      end
    end
  end

  describe '#move' do
    context 'Correctly performs moves' do
      it 'allows a legal move' do
        game.move(0, 1)
        expect(game.render).to eq([[3, 2], [1], []])
      end

      it "doesn't allow an illegal move" do
        game.first_tower = [3, 2]
        game.second_tower = [1]
        game.third_tower = []
        game.move(0, 1)
        expect(game.render).to eq([[3, 2], [1], []])
      end

      it "doesn't allow a move from empty tower" do
        game.first_tower = [3, 2]
        game.second_tower = [1]
        game.third_tower = []
        game.move(2, 1)
        expect(game.render).to eq([[3, 2], [1], []])
      end
    end
  end

  describe '#won' do
    context 'Correctly determines if the game has ended' do
      it "returns false if the game hasn't ended" do
        expect(game.won?).to eq(false)
      end

      it "returns true if the game has ended" do
        game.first_tower = []
        game.second_tower = []
        game.third_tower = [3, 2, 1]
        expect(game.won?).to eq(true)
      end
    end
  end
end
