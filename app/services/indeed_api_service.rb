class IndeedApiService
  def self.search(parameters)
    new(parameters).search
  end

  def initialize(parameters)
    @location = parameters[:zip] || parameters[:city_state]
    @terms = parameters[:terms]
  end

  def search
    response = Faraday.get "http://api.indeed.com/ads/apisearch?publisher=#{ENV['INDEED_API_KEY']}&v=2&format=json&limit=25&l=#{location}&q=#{terms.join(',')}"
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :location, :terms
end
