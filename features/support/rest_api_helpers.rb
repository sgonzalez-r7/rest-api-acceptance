module RestApiHelpers
  def base_uri
    'http://0.0.0.0:5000/rest_api/v2'
  end

  def http_with_headers
    HTTP.with(accept: 'application/json',
              'Token' => '75e3db94166b7d1f60994a41b573e6ad')
  end
end
World(RestApiHelpers)

module FileHelpers
  def data_dir
    File.dirname(__FILE__) + '/../data/'
  end
end
World(FileHelpers)
