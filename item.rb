require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(id, genre, author, source, label, publish_date, archived)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def can_be_archived?
    age = Date.today - @publish_date
    age > 10 * 365
  end

  def move_to_archive
    @archived = if can_be_archived
                  true
                else
                  false
                end
  end
end

item = Item.new(1, 'genre', 'author', 'source', 'label', '2013-11-01', false)
puts item.can_be_archived?
