# frozen_string_literal: true
require_relative 'item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at
  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end
  def can_be_archived?
    super && (Time.now.year - @last_played_at.year) > 2
  end
  def to_hash
    {
      publish_date: @publish_date.strftime('%Y-%m-%d'),
      multiplayer: @multiplayer,
      last_played_at: @last_played_at.strftime('%Y-%m-%d')
    }
  end
  def self.from_hash(hash)
    new(
      hash['publish_date'],
      hash['multiplayer'],
      hash['last_played_at']
    )
  end
  def to_h
    {
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'publish_date' => @publish_date
    }
  end
end







