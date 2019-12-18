class Artist
  attr_accessor :name, :genre, :id

  # @@artists = {}
  @@total_rows = 0

  def initialize(name, genre, id)
    @name = name
    @genre = genre
    @id = id || @@total_rows += 1
  end

  # def self.all
  #   @@artists.values().sort { |a, b| a.name.downcase <=> b.name.downcase }
  # end

  def save
    @@artists[self.id] = Artist.new(self.name, self.genre, self.id)
  end

  # def ==(artist_to_compare)
  #   self.name() == artist_to_compare.name()
  # end

end
