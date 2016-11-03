require 'rails_helper'

describe 'Indeed Api Controller' do
  it 'can make new searches' do
    #As a Rake Task
    #When I curl the search endpoint with a zipcode and a search term
    get '/api/v1/search?location=80233&term=ruby'
    #I expect the database to get a new search record
    expect(response.status).to eq(200)
    expect(Search.count).to eq(1)
    #and I expect to get a response with up to 25 search results
    
  end
end
