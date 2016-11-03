class IndeedApiService
  def self.search(parameters)
    new(parameters).search
  end

  def initialize(parameters)
    @location = parameters[:zip] || parameters[:city_state]
    @terms = parameters[:terms]
  end

  def search
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    total_results = parsed_response[:totalResults]
    last_result = parsed_response[:end]
    jobs_results = parsed_response[:results]
    #if last_result == total_results
      #search again, start from last_result
      #append results to jobs_result
    #end
    results = jobs_results.map do |raw_job|
      JobCreatorService.process(raw_job)
    end
    record_results(total_results, results)
    byebug
    results
  end

  def conn
    Faraday.new(url: 'http://api.indeed.com/ads/apisearch') do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
      faraday.params[:publisher] = ENV['INDEED_API_KEY']
      faraday.params[:v] = 2
      faraday.params[:format] = 'json'
    end
  end

  def response
    conn.get do |req|
      req.params[:limit] = 25
      req.params[:l] = location
      req.params[:q] = terms.join(',')
    end
  end

  def record_results(hits, jobs)
    searched_location = Location.find_or_create_by(zip: @location)
    searched_terms = @terms.map do |term|
      Term.find_or_create_by(keyword: term)
    end
    search_record = Search.create(hits: hits, location: searched_location)
    search_record.terms << searched_terms
    search_record.jobs << jobs
  end
  private
    attr_reader :location, :terms
end
