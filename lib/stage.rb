require './lib/artist'

class Stage
  attr_accessor :name, :id, :artists

  @@stages = {}
  @@total_stages = 0


  def initialize(name, id)
    @name = name
    @id = id || @@total_stages += 1
    @artists = []
  end

  def self.all
      @@stages.values().sort { |a, b| a.name.downcase <=> b.name.downcase}
  end

  def save
    @@stages[self.id] = Stage.new(self.name, self.id)
  end

  def ==(stage_to_compare)
    self.name() == stage_to_compare.name()
  end

  def self.clear
    @@stages = {}
    @@total_stages = 0
  end

  def add_artist(artist)
    @artists.push(artist)
  end

  def self.find(id)
    @@stages[id]
  end

  def delete_artist(id)
    @artists.delete_at(id)
  end
end
