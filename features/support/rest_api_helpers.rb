module FileHelpers
  def data_dir
    File.dirname(__FILE__) + '/../data/'
  end
end
World(FileHelpers)


module RestApiHelpers
  include FileHelpers

  def base_uri
    'http://0.0.0.0:5000/rest_api/v2'
  end

  def token
    json_key = JSON.parse File.read(data_dir + 'key.json')
    json_key['token']
  end

  def http_with_headers
    HTTP.with(accept: 'application/json', 'Token' => token)
  end
end
World(RestApiHelpers)
