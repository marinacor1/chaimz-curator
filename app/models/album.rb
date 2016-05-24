class Album < OpenStruct
  def self.service
    AlbumsService.new
  end

  def self.find(id)
    album_hash = service.album_hash(id)
    Album.new(album_hash)
  end

  def self.all
    album_array = service.albums_hash
    album_array.map do |hash|
      Album.new(hash)
    end
  end

  def save
    
  end
end
