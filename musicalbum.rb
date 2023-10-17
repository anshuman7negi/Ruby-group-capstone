require './item'

class MusicAlbum < Item
  attr_accessor :id, :on_spotify

  def initialize(id, on_spotify, publish_date)
    super(publish_date)
    @id = id
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
