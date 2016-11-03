class JobCreatorService
  def initialize(raw_jobs)
    job_list = raw_jobs.map do |raw_job|
      location = Location.find_or_create_by(
        country: raw_job[:country],
        state: raw_job[:state],
        city: raw_job[:city],
        formatted_location_full: raw_job[:formattedLocationFull]
      )
      Job.find_or_create_by(
        jobkey: raw_job[:jobkey],
        post_date: raw_job[:date],
        job_title: raw_job[:jobtitle],
        company: raw_job[:company],
        snippet: raw_job[:snipet],
        url: raw_job[:url],
        location: location.id
      )
    end
  end
end
