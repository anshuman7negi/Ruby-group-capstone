require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(id, genre, author, source, label, publish_date)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = can_be_archived?
  end

  def can_be_archived?
    age = Date.today - @publish_date
    age > 10 * 365
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end

item = Item.new(1, 'genre', 'author', 'source', 'label', '2013-11-01')
puts item.can_be_archived?
