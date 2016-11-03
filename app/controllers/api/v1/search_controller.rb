class Api::V1::SearchController < ApplicationController
  def create
    response = Faraday.get 'http://api.indeed.com/ads/apisearch?publisher=8281335922775115&v=2&format=json&limit=25&l=80233&q=ruby'
    @jobs = JSON.parse(response.body, symbolize_names: true)[:results]
    render json: @jobs
  end
end
