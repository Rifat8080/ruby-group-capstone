class Item
  attr_accessor :genre, :label, :author, :publish_date, :archived
  attr_reader :id

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @publish_date = publish_date
    @archived = archived
    @label = []
  end
end
