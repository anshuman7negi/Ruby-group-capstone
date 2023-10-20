# frozen_string_literal: true

require './author'
require './item'

RSpec.describe Author do
  let(:author) { Author.new('John', 'Doe') }
  let(:item) { Item.new('2020-10-06') }

  describe '#initialize' do
    it 'creates an author with a unique ID' do
      expect(author.id).to be_an(Integer)
      expect(author.id).to be > 0
    end

    it 'initializes with provided first and last names' do
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
    end

    it 'initializes with an empty items array' do
      expect(author.items).to be_an(Array)
      expect(author.items).to be_empty
    end
  end

  describe '.next_id' do
    it 'returns unique IDs for each invocation' do
      first_id = Author.next_id
      second_id = Author.next_id

      expect(first_id).to be_an(Integer)
      expect(second_id).to be_an(Integer)
      expect(first_id).not_to eq(second_id)
    end
  end

  describe '#add_item' do
    it 'adds an item to the author\'s items' do
      author.add_item(item)
      expect(author.items).to include(item)
      expect(item.author).to eq(author)
    end
  end
end
