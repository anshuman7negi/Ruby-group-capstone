require_relative 'game'

RSpec.describe Game do
  let(:game) { Game.new(true, '2021-10-10', '2023-10-16') }
  let(:item) { Item.new('2023-10-16') }

  context 'initialization' do
    it 'should set the multiplayer attribute' do
      expect(game.multiplayer).to eq(true)
    end

    it 'should set the last_played_at attribute' do
      expect(game.last_played_at).to eq(Date.parse('2021-10-10'))
    end

    it 'should set the last_played_at attribute' do
      expect(game.last_played_at).to eq(Date.parse('2021-10-10'))
    end
  end

  context 'can_be_archived?' do
    it 'should return true if the cover state is bad' do
      game.last_played_at = '2023-10-16'
      expect(game.can_be_archived?).to be(true)
    end

    it 'should call the superclass method if cover state is good' do
      game.last_played_at = '1999-10-12'
      expect(game.can_be_archived?).to eq(false)
    end
  end
end





