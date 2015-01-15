require 'spec_helper'

describe RestApi do
  describe '.new' do
    it 'sets the api key' do
      rest_api = RestApi.new key: 'shezzzaaaahhhmmmmm'
      expect(rest_api.key).to eql 'shezzzaaaahhhmmmmm'
    end

    it 'sets the base uri' do
      rest_api = RestApi.new base_uri: 'http://0.0.0.0:5000/rest_api/v2'
      expect(rest_api.base_uri).to eql 'http://0.0.0.0:5000/rest_api/v2'
    end

  end

  describe '#key' do
    it 'accesses the api key' do
      rest_api = RestApi.new
      rest_api.key = 'shezzzaaaahhhmmmmm'
      expect(rest_api.key).to eql 'shezzzaaaahhhmmmmm'
    end
  end

  describe '#base_uri' do
    it 'accesses the base uri' do
      rest_api = RestApi.new
      rest_api.base_uri = 'http://0.0.0.0:5000/rest_api/v2'
    end
  end

  describe '#get' do
    it 'makes an HTTP get request' do
      rest_api = RestApi.new key:      'bf5df765488b304dfc88c2eb41d9d43f',
                             base_uri: 'http://0.0.0.0:5000/rest_api/v2'
      rest_api.get('/base')
      expect(rest_api.response.code).to eql 200
    end
  end

end
