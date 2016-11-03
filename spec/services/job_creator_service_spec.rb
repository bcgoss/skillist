require 'rails_helper'

describe 'Job Creator' do
  it 'accepts an array and returns jobs' do
response = '
    {
      "jobtitle": "Blake Street Sweeper",
      "company": "Equus Software",
      "city": "Denver",
      "state": "CO",
      "country": "US",
      "formattedLocation": "Denver, CO",
      "source": "Equus Software",
      "date": "Wed, 02 Nov 2016 01:17:27 GMT",
      "snippet": "Web <b>Developer</b>, Entry (Denver)*. We are looking for <b>developers</b> who love solving problems with code. Equus Software, a rapidly growing technology company, needs...",
      "url": "http://www.indeed.com/viewjob?jk=b9e41d24a4355620&qd=CqxkpTXu6Bp2v5ASjvIOTq82-d0Qx5xgJQ32pSWEkZfYvRwPhuh9I-v2jivq1qsT4hGfIuKaNSzVM6GAstR9lOhnegcaGgPYB4G-eyHN82-iWJ_aeqaJvOpkeEdr-ePk&indpubnum=8281335922775115&atk=1b0ljt1jha3pgc43",
      "jobkey": "b9e41d24a4355620",
      "sponsored": false,
      "expired": false,
      "indeedApply": true,
      "formattedLocationFull": "Denver, CO 80202",
      "formattedRelativeTime": "1 day ago",
      "stations": ""
    }'

    raw_jobs = JSON.parse(response, symbolize_names:true)
    expect{ JobCreatorService.process(raw_jobs) }.to change{ Job.count }.by(1)
  end
end
