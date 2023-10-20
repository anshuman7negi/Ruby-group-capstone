# frozen_string_literal: true

require './game'
require './item'

RSpec.describe Game do
  let(:game) { Game.new(true, '2021-10-10', '2023-10-16') }
  let(:item) { Item.new('1999-10-16') }

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
    it 'should return true if last played is less than 2 year' do
      game.last_played_at = Date.parse('2020-10-16')
      game.publish_date = Date.parse('1999-10-10')
      expect(game.can_be_archived?).to be(true)
    end
    it 'should call the superclass method and return false' do
      game.last_played_at = Date.parse('2023-10-12')
      game.publish_date = Date.parse('2020-10-10')
      expect(game.can_be_archived?).to eq(false)
    end
  end
end
