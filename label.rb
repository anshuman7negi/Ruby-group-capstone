class Label
  attr_accessor :title, :items, :id, :color

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end

  def to_h
    {
      'id' => @id,
      'title' => @title,
      'color' => @color,
      'items' => @items.map(&:to_h)
    }
  end
end
