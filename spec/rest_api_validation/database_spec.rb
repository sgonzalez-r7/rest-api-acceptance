require 'spec_helper'

module RestApiValidation
describe Database do
  let(:data_dir) { File.dirname(__FILE__) + '/../support/data' }

  describe '.data_dir' do
    it 'returns its data source dir' do
      expect(Database.data_dir).to eql '/Users/sgonzalez/rapid7/rest-api-acceptance/lib/rest_api_validation/../../features/support/data'
    end
  end

  describe '.fetch_data_for' do
    it 'returns requested data' do
      workspace = JSON.parse File.read(data_dir + '/workspace.json')
      expect(Database.fetch_data_for('workspace')).to eql workspace
    end
  end

end
end
