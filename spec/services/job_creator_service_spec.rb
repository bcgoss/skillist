require 'rails_helper'

describe 'Job Creator' do
  it 'accepts an array and returns jobs' do
    raw_jobs = [{country: 'Foo'}, {country: 'Bar'}]
    JobCreatorService.new(raw_jobs)
  end
end
