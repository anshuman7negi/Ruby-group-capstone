# frozen_string_literal: true

require './item'

class Books < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_h
    {
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'publish_date' => @publish_date
    }
  end
end
