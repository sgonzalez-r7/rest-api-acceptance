require 'spec_helper'

module RestApiValidation
describe Database do
  let(:test_data_dir) { File.dirname(__FILE__) + '/../support/data' }

  describe '#fetch_data_for' do
    it 'fetches all data for a model' do
      database = Database.new data_dir: test_data_dir
      results  = database.fetch_data_for('hosts')
      data     = JSON.parse File.read("#{test_data_dir}/host.json")
      expect(results).to eq data
    end

    it 'fetches data with an attribute' do
      database = Database.new data_dir: test_data_dir
      host     = database.fetch_data_for('hosts', id: 2).first
      expect(host['id']).to eql 2
    end
  end

end
end
