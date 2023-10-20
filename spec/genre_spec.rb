# frozen_string_literal: true

require './genre'

describe Genre do
  let(:genre) { Genre.new('Alternative') }

  context 'initialization' do
    it 'should set the name attribute' do
      expect(genre.name).to eq('Alternative')
    end
  end

  context 'add_item' do
    it 'should add an item to the items collection' do
      item = Item.new('2023-10-16')
      genre.add_item(item)
      expect(genre.items).to include(item)
    end

    it 'should set the genre of the added item to the current genre' do
      item = Item.new('2023-10-16')
      genre.add_item(item)
      expect(item.genre).to eq(genre)
    end
  end
end
