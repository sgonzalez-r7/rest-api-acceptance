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
    context 'no param' do
      it 'returns all data for a model' do
        workspace = JSON.parse File.read(data_dir + '/workspace.json')
        expect(Database.fetch_data_for('workspace')).to eql workspace
      end
    end

    context 'with id param' do
      it 'returns data for model with id param' do
        workspace = JSON.parse File.read(data_dir + '/workspace.json')
        workspace_118 = workspace.select { |ws| ws['id'] == 118 }
        expect(Database.fetch_data_for('workspace', id: 118)).to eql workspace_118
      end
    end
  end

end
end
