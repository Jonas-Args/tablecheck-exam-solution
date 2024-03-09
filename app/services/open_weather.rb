class OpenWeather
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5'

  MISSING_PARAMS = 'Missing city params'
  SERVER_ERROR = 'Failed to retrieve weather data'

  attr_reader :city

  def initialize(params)
    @city = params[:city]
  end

  def fetch
    return { error: MISSING_PARAMS } unless city.present?

    response = self.class.get('/weather', { query: { q: city, appid: api_key, units: 'metric' } })

    if response.code == 200
      response.parsed_response
    else
      { error: SERVER_ERROR }
    end
  end

  def api_key
    ENV['API_KEY'] || 'fbed511a2afc2082d7d5823337173c6e'
  end
end
