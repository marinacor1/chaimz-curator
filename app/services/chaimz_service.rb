class ChaimzService
  def initialize #might need to pass in a user
    @connection = Faraday.new(url: "https://my-chaimz.herokuapp.com/")
    @connection.headers["Authorization"] = "Bearer 35148ad62db32ff044d6df2cd57" #Bearer #ENV['token']
  end

  def get_artists
    @connection.get "/api/v1/artists" #@connection.get "/api/v1/artists?token=#@user.token"
  end

#service = ChaimzService.new
#service.get_artists
#service.get_artists.body

  def get_artist(id)
   @connection.get "artists/#{id}"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true) #service.artists_hash[1][:name]
  end

#service = ChaimzService.new
#response = service.get_artists
#service.parse(response)
#service.parse(response)[10]

  def artists_hash
    parse(get_artists)
  end

  def artist_hash(id)
    parse(get_artist(id))
  end
end
