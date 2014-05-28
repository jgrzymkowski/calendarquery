require 'json'
require 'google/api_client'

class GoogleClient
  KEY = 'AIzaSyAu8lyzyBOdUlp5wOcASKvYDbCfHCMYZ9I'

  def load_calendars( calendar_id, start_date, stop_date )
    response = client.execute(:api_method => service.events.list,
                              :authenticated => false,
                              :key => KEY,
                              :parameters => {
                                'calendarId' => calendar_id,
                                'timeMin' => start_date.strftime('%Y-%m-%dT%H:%M:%S%:z'),
                                'timeMax' => stop_date.strftime('%Y-%m-%dT%H:%M:%S%:z'),
                                'maxResults' => 2500
                              }
                             )
    if response.status != 200
      raise 'Error contacting Google API'
    end

    JSON.parse(response.body)
  end

  private
  def client
    @client ||= Google::APIClient.new(
      application_name: 'Calendar Query',
      application_version: '1.0')
  end

  def service
    @service ||= client.discovered_api('calendar', 'v3')
  end
end

