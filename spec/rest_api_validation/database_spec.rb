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

  describe '#fetch_ids_for' do
    it 'returns a set of ids for a model' do
      database = Database.new data_dir: test_data_dir
      ids      = database.fetch_ids_for('hosts')
      data     = JSON.parse File.read("#{test_data_dir}/host.json")
      data_ids = Set.new data.map { |e| e['id'] }
      expect(ids).to eql data_ids
    end
  end

  describe '#fetch_a' do
    it 'returns 1 object of a model' do
      database = Database.new data_dir: test_data_dir
      host     = database.fetch_a(:host)
      data     = JSON.parse File.read("#{test_data_dir}/host.json")
      expect(host).to eql data.first
    end

    it 'returns 1 object of a model with a given param' do
      database  = Database.new data_dir: test_data_dir
      workspace = database.fetch_a(:workspace)
      host      = database.fetch_a(:host, workspace_id: workspace['id'])
      expect(host['workspace_id']).to eql workspace['id']
    end

  end
end
end
