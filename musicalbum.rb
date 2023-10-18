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

  #move this to item.rb
  def set_genre(genre)
    @genre = genre
    genre.add_item(self) if genre
  end
end
