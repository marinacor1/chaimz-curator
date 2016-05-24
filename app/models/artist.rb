class Artist < OpenStruct

  def self.service
    ChaimzService.new
  end

  def self.find(id)
    artist_hash = service.artist_hash(id)
    Artist.new(artist_hash)
  end

  def self.all
    artist_array = service.artists_hash
    artist_array.map do |artist_hash|
      Artist.new(artist_hash)
    end
  end

  def save
    Artist.service.create_artist(self.to_h)
  end
end
