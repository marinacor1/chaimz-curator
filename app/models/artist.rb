class Artist

  attr_accessor :id, :name, :created_at, :updated_at

  def self.service
    ChaimzService.new
  end

  def initialize(new_artist_hash)
    @id = new_artist_hash[:id]
    @name = new_artist_hash[:name]
    @created_at = new_artist_hash[:created_at]
    @updated_at = new_artist_hash[:updated_at]
  end

  def self.find(id)
    temp_artist_hash = service.artist_hash(id)
    Artist.new(temp_artist_hash)
  end

  def self.all
    artist_array = service.artists_hash
    artist_array.map do |artist_hash|
      Artist.new(artist_hash)
    end
  end
end
