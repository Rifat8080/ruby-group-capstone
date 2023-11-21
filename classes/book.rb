require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state, :publish_date, :label, :title

  def initiatlize(title, publisher, cover_state: 'good', published_date: nil, archived: false)
    super(published_date, archived: archived)
    @id = rand(0...1000)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
    @label = nil
  end
end
