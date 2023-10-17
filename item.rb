require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(genre, author, source, label, publish_date)
    @id = id || Random.rand(1..1000)
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

item = Item.new('genre', 'author', 'source', 'label', '2013-10-01')
puts item.can_be_archived?
