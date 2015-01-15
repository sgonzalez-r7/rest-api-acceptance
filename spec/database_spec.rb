require 'spec_helper'

describe Database do
  let(:data_dir) { File.dirname(__FILE__) + '/' + '../features/support/data' }

  describe '#new' do
    it 'captures all the model names' do
      database = Database.new data_dir: data_dir

      database_models      = Set.new database.models
      model_files          = Dir[data_dir + '/*.json']
      model_file_basenames = Set.new model_files.map { |file| File.basename(file, '.json') }

      expect(database_models).to eql model_file_basenames
    end

    it 'it loads model data into memory' do
      database = Database.new data_dir: data_dir

      expect(database.data).not_to be_empty
    end
  end

  describe '#load_data' do
    it 'captures all the model names' do
      database = Database.new
      database.load_data data_dir: data_dir

      database_models      = Set.new database.models
      model_files          = Dir[data_dir + '/*.json']
      model_file_basenames = Set.new model_files.map { |file| File.basename(file, '.json') }

      expect(database_models).to eql model_file_basenames
    end

    it 'it loads model data into memory' do
      database = Database.new
      database.load_data data_dir: data_dir

      expect(database.data).not_to be_empty
    end
  end

  describe '#fetch_data_for' do
    it 'fetches all the data for a model' do
      database  = Database.new data_dir: data_dir
      data      = database.fetch_data_for'workspace'

      file      = data_dir + '/' + 'workspace.json'
      file_data = JSON.parse File.read(file)

      expect(data).to eql file_data
    end

    it 'fetches all the data by attribute for a model' do
      database  = Database.new data_dir: data_dir
      data      = database.fetch_data_for 'workspace', id: 118

      file      = data_dir + '/' + 'workspace.json'
      file_data = JSON.parse File.read(file)
      obj_118   = file_data.select { |obj| obj['id'] == 118 }

      ap obj_118

      expect(data).to eql obj_118
    end
  end

















end
