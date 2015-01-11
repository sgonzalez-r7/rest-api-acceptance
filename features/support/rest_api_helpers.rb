module RestApiHelpers
  def base_uri
    'http://0.0.0.0:5000/rest_api/v2'
  end

  def http_with_headers
    HTTP.with(accept: 'application/json',
              'Token' => '2367595fa33d7a98a7f3393791490d0c')
  end
end
World(RestApiHelpers)
