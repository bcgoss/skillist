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
end
