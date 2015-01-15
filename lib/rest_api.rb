require 'http'

class RestApi
  attr_accessor :key, :base_uri
  attr_reader   :response

  def initialize(key: '', base_uri: '')
    @key      = key      unless key.empty?
    @base_uri = base_uri unless base_uri.empty?
  end

  def get(path)
    @response = HTTP.with(accept: 'application/json',
                                  'Token' => key).get(base_uri + path)
  end

end
