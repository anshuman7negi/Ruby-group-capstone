require './books'
require './item'

describe Books do
  let(:book) { Books.new('anshuman', 'Good', '2023-10-16') }
  let(:item) { Item.new('2023-10-16') }

  context 'initialization' do
    it 'should set the publisher attribute' do
      expect(book.publisher).to eq('anshuman')
    end

    it 'should set the cover_state attribute' do
      expect(book.cover_state).to eq('Good')
    end

    it 'should set the publish_date attribute' do
      expect(book.publish_date).to eq(Date.parse('2023-10-16'))
    end

    it 'should set the archived attribute to false by default' do
      expect(book.archived).to be(false)
    end
  end

  context 'can_be_archived?' do
    it 'should return true if the cover state is bad' do
      book.cover_state = 'bad'
      expect(book.can_be_archived?).to be(true)
    end

    it 'should call the superclass method if cover state is good' do
      book.cover_state = 'Good'
      book.publish_date = Date.parse('1999-10-10')
      expect(book.can_be_archived?).to eq(true)
    end
  end
end
