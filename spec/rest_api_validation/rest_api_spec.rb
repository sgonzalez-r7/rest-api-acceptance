require 'spec_helper'

module RestApiValidation
describe RestApi do
  describe '.key' do
    it 'returns its api key' do
      data_dir = File.dirname(__FILE__) + '/../../features/support/data/'
      keys     = JSON.parse File.read(data_dir + 'key.json')
      api_key  = keys.first['token']
      expect(RestApi.key).to eql api_key
    end
  end

  describe '.key=' do
    it 'sets api key' do
      RestApi.key = 'notavalidkey'
      expect(RestApi.key).to eql 'notavalidkey'
    end
  end

  describe '.base_uri' do
    it 'returns its base uri' do
      expect(RestApi.base_uri).to eql 'http://0.0.0.0:5000/rest_api/v2'
    end
  end
end
end
