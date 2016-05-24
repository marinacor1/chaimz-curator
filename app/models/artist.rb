class Artist

  attr_accessor :id, :name, :created_at, :updated_at
  
  def initialize(artist_hash)
    @id = artist_hash[:id]
    @name = artist_hash[:name]
    @created_at = artist_hash[:created_at]
    @updated_at = artist_hash[:updated_at]
  end
end
