require 'http'

module RestApiValidation
class  Client
  attr_reader :rest_api

  def initialize(rest_api:)
    @rest_api = rest_api
  end

  def generate_index_path(options={})
    path = [nil]
    options.each_key do |key|
      path << normalize_key(key) unless key == :resource
      path << options[key]
    end
    path.join('/')
  end


  def generate_show_path(options={})
    path = [nil]
    options.each_key do |key|
      path << normalize_key(key)
      path << options[key]
    end
    path.join('/')
  end

  def make_get_request(path)
    key      = rest_api.key
    base_uri = rest_api.base_uri
    HTTP.with(accept: 'application/json',
                      'Token' => key).get(base_uri + path)
  end

  private

  def normalize_key(key)
    key.to_s.gsub /_id/, 's'
  end
end
end
