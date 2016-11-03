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
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    total_results = parsed_response[:totalResults]
    last_result = parsed_response[:end]
    jobs_results = parsed_response[:results]
    #if last_result == total_results
      #search again, start from last_result
      #append results to jobs_result
    #end
    results = jobs_results.map do |raw_job|
      JobCreator.new(raw_job)
    end
    record_results(total_results, results)
    
  end

  private
    attr_reader :location, :terms

    def record_results(hits, jobs)
      searched_location = Location.find_or_create_by(postal_code: @location)
      search_record = Search.create(hits: hits, location: searched_location)
      search_record.jobs << jobs
    end
end
