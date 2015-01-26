require 'spec_helper'

module RestApiValidation
describe Database do
  let(:test_data_dir) { File.dirname(__FILE__) + '/../support/data' }
  let(:database)      { Database.new data_dir: test_data_dir }

  def load_data(resource)
    resource_name = resource.to_s.singularize
    file          = "#{test_data_dir}/#{resource_name}.json"
    other_file    = "#{test_data_dir}/#{resource_name}_other.json"
    data          = JSON.parse File.read(file)
    other_data    = JSON.parse File.read(other_file)
    (data + other_data).ostructify
  end

  def to_ids(data)
    Set.new data.map { |e| e.id }
  end

  describe '#fetch_data_for' do
    it 'returns a set of all data for a model' do
      hosts    = database.fetch_data_for(:hosts)
      host_ids = to_ids(hosts)
      data     = load_data(:hosts)
      data_ids = to_ids(data)

      expect(host_ids).to eql data_ids
    end

    it 'returns data with the given attribute' do
      hosts = database.fetch_data_for(:hosts, id: 2)
      host_ids = to_ids(hosts)
      expect(host_ids).to eql Set.new [2]
    end
  end

  describe '#fetch_ids_for' do
    it 'returns a set of all ids for a model' do
      ids      = database.fetch_ids_for(:hosts)
      data     = load_data(:hosts)
      data_ids = to_ids(data)
      expect(ids).to eql data_ids
    end

    it 'returns ids for data with the given attribute' do
      ids = database.fetch_ids_for(:hosts, id: 2)
      expect(ids).to eql Set.new [2]
    end
  end

  describe '#fetch_a' do
    it 'returns first object of a model' do
      host = database.fetch_a(:host)
      data = load_data(:hosts)
      expect(host).to eql data.first
    end

    it 'returns first object of a model with a given param' do
      workspace = database.fetch_a(:workspace)
      host      = database.fetch_a(:host, workspace_id: workspace.id)
      expect(host.workspace_id).to eql workspace.id
    end
  end

  describe '#fetch_an_other' do
    it 'returns the first object of other model' do
      host_other = database.fetch_an_other(:host)
      expect(host_other.model).to eql 'host_other'
    end
  end
end
end
