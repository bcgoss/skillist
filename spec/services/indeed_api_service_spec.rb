require 'rails_helper'

describe 'Indeed Api Service' do
  describe 'search endpoint' do
    it 'returns a list of jobs' do
      pending 'job creator'
      response = IndeedApiService.search(zip: 80233, terms: ['ruby'])
      expect(response).to_not be_nil
    end
  end

  it 'searches the Indeed Api' do
    pending 'job creator'
    service = IndeedApiService.new(zip: 80233, terms: ['ruby'])
    service.search
  end
end
