require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(date)
    @multiplayer = multiplayer
    @last_played_at = date
  end

  def can_be_archived?
    super && (Time.now.year - @last_played_at.year) > 2
  end
end