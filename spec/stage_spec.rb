require 'rspec'
require 'stage'
require 'artist'

describe '#Stage' do
  before(:each) do
    Stage.clear()
    @stage1 = Stage.new("Main", nil)
    @new_artist = Artist.new("Post Malone", "rap", nil)
    @new_artist2 = Artist.new("Drake", "rap", nil)
    @new_artist3 = Artist.new("Tupac", "rap", nil)
    @stage1.add_artist(@new_artist)
    @stage1.add_artist(@new_artist2)
    @stage1.add_artist(@new_artist3)
    @stage1.save
  end

  describe('.save') do
    it('saves a stage') do
      expect(Stage.all).to(eq([@stage1]))
    end
  end

  describe('.add_artist') do
    it('saves an array of artists') do
      expect(@stage1.artists).to(eq([@new_artist, @new_artist2, @new_artist3]))
    end
  end

  describe('#find') do
    it('find a stage by its id') do
      expect(Stage.find(1)).to(eq(@stage1))
    end
  end

  describe('.delete')do
    it('delete a selected artist')do
    @stage1.delete_artist(0)
      expect(@stage1.artists).to(eq([@new_artist2, @new_artist3]))
    end
  end
end
