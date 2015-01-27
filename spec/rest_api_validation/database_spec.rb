require 'spec_helper'

module RestApiValidation
describe Database do
  let(:test_data_dir) { File.dirname(__FILE__) + '/../support/data' }
  let(:database)      { Database.new data_dir: test_data_dir }

  describe '#fetch' do
    it 'returns all objects of type model (including other)' do
      hosts       = database.fetch(:hosts)
      types       = hosts.map    { |obj|  obj['model']   }
      wrong_types = types.reject { |type| type =~ /host/ }

      expect(wrong_types).to be_empty
    end

    context 'argument is a symbol - plural' do
      it 'returns same number of objects as the database has' do
        hosts          = database.fetch(:hosts)
        hosts_database = load_data_for(:hosts)

        expect(hosts.count).to eql hosts_database.count
      end
    end

    context 'argument is a symbol - singular' do
      it 'returns same number of objects as the database has' do
        hosts          = database.fetch(:host)
        hosts_database = load_data_for(:hosts)

        expect(hosts.count).to eql hosts_database.count      end
    end

    context 'argument is a string - plural' do
      it 'returns same number of objects as the database has' do
        hosts          = database.fetch('hosts')
        hosts_database = load_data_for(:hosts)

        expect(hosts.count).to eql hosts_database.count      end
    end

    context 'argument is a string - singular' do
      it 'returns same number of objects as the database has' do
        hosts          = database.fetch('host')
        hosts_database = load_data_for(:hosts)

        expect(hosts.count).to eql hosts_database.count      end
    end
  end

  describe 'Array#where' do
    it 'returns objects with the given attribute' do
      host = database.fetch(:hosts).where(id: 1).first

      expect(host['id']).to eql 1
    end
  end
end
end
