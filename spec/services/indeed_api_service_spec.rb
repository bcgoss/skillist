require 'rails_helper'

describe 'Indeed Api Service' do
  describe 'search endpoint' do
    it 'returns a list of jobs' do
      response = IndeedApiService.search(zip: 80233, terms: ['ruby'])
      expect(response).to_not be_nil
    end
  end

  it 'searches the Indeed Api' do
    service = IndeedApiService.new(zip: 80233, terms: ['ruby'])
    service.search
  end

  it 'records a search' do
    service = IndeedApiService.new(zip: 80233, terms: ['ruby'])
    location = create :location
    jobs = create_list :job, 3, location: location
    service.record_results(3, jobs)

    expect(Search.count).to eq(1)
  end
end
