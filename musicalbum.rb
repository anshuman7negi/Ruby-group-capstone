require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @id = id
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
