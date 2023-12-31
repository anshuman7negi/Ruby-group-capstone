require './item'

class MusicAlbum < Item
  attr_accessor :name, :on_spotify
  attr_reader :genre

  def initialize(name, on_spotify, publish_date)
    super(publish_date)
    @name = name
    @on_spotify = on_spotify
    @genre = nil
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_h
    {
      'name' => @name,
      'on_spotify' => @on_spotify,
      'publish_date' => @publish_date,
      'genre_name' => @genre&.name
    }
  end
end
