class PropublicaService
  def members_of_house(state)
    response = conn.get("/congress/v1/members/house/#{state}/current.json")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.propublica.org") do |req|
      req.headers["X-API-Key"] = ENV["PROPUBLICA_API_KEY"]
      req.adapter Faraday.default_adapter
    end
  end
end
