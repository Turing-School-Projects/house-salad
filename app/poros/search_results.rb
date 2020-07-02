class SearchResults
  def members(state)
    # This is the faraday connection that has the base url for the api
    conn = Faraday.new("https://api.propublica.org") do |req|
      # The key for the header must match the Propublica API docs in order to work
      req.headers["X-API-Key"] = ENV["PROPUBLICA_API_KEY"]
    end

    # The response is where the GET request is being made to the api and takes an argument of the endpoints specific path.
    response = conn.get("/congress/v1/members/house/#{state}/current.json")

    # Using `JSON.parse` it is now a ruby hash which is easier to work with
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    # @members is an array of member hashes
    @members = parsed_response[:results].map do |member_data|
      Member.new(member_data)
    end
  end
end
