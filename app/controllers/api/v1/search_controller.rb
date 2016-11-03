class Api::V1::SearchController < ApplicationController
  def create
    @jobs = IndeedApiService.search(zip: 80233, terms: ['ruby'])
    render json: @jobs
  end
end
