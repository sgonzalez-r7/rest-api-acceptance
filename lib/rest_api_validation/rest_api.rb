module RestApiValidation
module RestApi
  def self.key
    @key ||= read_key
  end

  def self.base_uri
    'http://0.0.0.0:5000/rest_api/v2'
  end

  private

  def self.read_key
    data_dir = File.dirname(__FILE__) + '/../../features/support/data/'
    keys     = JSON.parse File.read(data_dir + 'key.json')
    keys.first['token']
  end
end
end
