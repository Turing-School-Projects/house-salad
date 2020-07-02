class PropublicaService
  def members_of_house(state)
    conn = Faraday.new("https://api.propublica.org") do |req|
      req.headers["X-API-Key"] = ENV["PROPUBLICA_API_KEY"]
    end

    response = conn.get("/congress/v1/members/house/#{state}/current.json")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end
end
