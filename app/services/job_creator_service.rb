class JobCreatorService
  attr_reader :job_data

  def self.process(raw_job)
    JobCreatorService.new(raw_job).start
  end

  def initialize(raw_job)
    @job_data = raw_job 
  end

  def start
    postal_code = get_postal_from_full_location(job_data[:formmatedLocationFull])
    location = Location.find_or_create_by(
      country: job_data[:country],
      state: job_data[:state],
      city: job_data[:city],
      postal_code: postal_code,
      formatted_location_full: job_data[:formattedLocationFull]
    )
    job = Job.find_or_create_by(
      jobkey: job_data[:jobkey],
      post_date: job_data[:date],
      job_title: job_data[:jobtitle],
      company: job_data[:company],
      snippet: job_data[:snipet],
      url: job_data[:url],
      location: location
    )
    job
  end

  def get_postal_from_full_location(full_location)
  #  full_location[/\d{5}(?:[-\s]\d{4})?/,1]
  end
  
end
