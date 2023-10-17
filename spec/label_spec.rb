require './label'

describe Label do
  let(:label) { Label.new('harry Potter', 'black') }

  context 'initialization' do
    it 'should set the title attribute' do
      expect(label.title).to eq('harry Potter')
    end

    it 'should set the color attribute' do
      expect(label.color).to eq('black')
    end
  end

  context 'add_item' do
    it 'should add an item to the items collection' do
      item = Item.new('2023-10-16')
      label.add_item(item)
      expect(label.items).to include(item)
    end
    
    it 'should set the label of the added item to the current label' do
        item = Item.new('2023-10-16')
        label.add_item(item)
        expect(item.label).to eq(label)
      end
  end

end
