require './musicalbum'

describe MusicAlbum do
  let(:musicalbum) { MusicAlbum.new(true, '2013-10-16') }
  let(:musicalbum2) { MusicAlbum.new(true, '2013-11-16') }
  let(:musicalbum3) { MusicAlbum.new(false, '2013-10-16') }

  context 'initialization' do
    it 'should set the on_spotify attribute' do
      expect(musicalbum.on_spotify).to be(true)
    end

    it 'should set the publish_date attribute' do
      expect(musicalbum.publish_date).to eq(Date.parse('2013-10-16'))
    end
  end

  context 'can_be_archived?' do
    it 'should return false if on_spotify is false' do
      expect(musicalbum3.can_be_archived?).to be(false)
    end

    it 'should return false if publish_date < 10y' do
      expect(musicalbum2.can_be_archived?).to be(false)
    end

    it 'should return true if on_spotify is true AND publish_date > 10y' do
      expect(musicalbum.can_be_archived?).to be(true)
    end
  end
end
