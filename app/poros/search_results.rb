class SearchResults
  def members(state)
    parsed_response = PropublicaService.new.members_of_house(state)
    # @members is an array of member hashes
    @members = parsed_response[:results].map do |member_data|
      Member.new(member_data)
    end
  end
end
