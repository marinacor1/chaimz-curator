class AlbumsService
  def initialize
    @connection = Faraday.new(url: "https://my-chaimz.herokuapp.com/api/v1/")
    @connection.headers["Authorization"] = "Bearer 35148ad62db32ff044d6df2cd57"
  end

  def get_albums
    @connection.get "albums"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_album(album_id)
    @connection.get "albums/#{album_id}"
  end

  def albums_hash
    parse(get_albums)
  end

  def album_hash(id)
    parse(get_album(id))
  end

end
