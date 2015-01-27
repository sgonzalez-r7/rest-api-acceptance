require 'spec_helper'

module RestApiValidation
describe Database do
  let(:test_data_dir) { File.dirname(__FILE__) + '/../support/data' }
  let(:database)      { Database.new data_dir: test_data_dir }

  describe '#fetch_data_for' do
    it 'returns same number of objects as the database has' do
      hosts          = database.fetch_data_for(:hosts)
      database_count = load_data_for(:hosts).count
      expect(hosts.count).to eql database_count
    end

    it 'returns all objects of type model (including other)' do
      hosts       = database.fetch_data_for(:hosts)
      types       = hosts.map { |obj| obj['model'] }
      wrong_types = types.reject { |type| type =~ /host/ }
      expect(wrong_types).to be_empty
    end

    it 'returns all objects with the given attribute' do
      hosts      = database.fetch_data_for(:hosts, id: 2)
      attributes = hosts.map { |obj| obj['id']  }
      wrong_attributes = attributes.reject { |a| a == 2 }
      expect(wrong_attributes).to be_empty
    end
  end

  describe '#fetch_a' do
    it 'returns an object of type model' do
      host = database.fetch_a(:host)
      expect(host['model']).to eql 'host'
    end

    it 'returns an object of a model with a given param' do
      host = database.fetch_a(:host, workspace_id: 2)
      expect(host['workspace_id']).to eql 2
    end
  end

  describe '#fetch_an_other' do
    it 'returns an object of type model_other' do
      host_other = database.fetch_an_other(:host)
      expect(host_other['model']).to eql 'host_other'
    end
  end

  describe '#fetch_ids_for' do
    it 'returns a set of all ids for a model' do
      ids  = Set.new database.fetch_ids_for(:hosts)
      data = load_data_for(:hosts)
      expect(ids).to eql to_set_of_ids(data)
    end

    it 'returns ids for data with the given attribute' do
      ids              = Set.new database.fetch_ids_for(:hosts, workspace_id: 2)
      hosts            = ids.map { |id| database.fetch_a(:host, id: id) }
      attributes       = hosts.map { |h| h['workspace_id']  }
      wrong_attributes = attributes.reject { |a| a == 2 }
      expect(wrong_attributes).to be_empty
    end
  end
end
end
