require 'set'
require 'json'
require 'ostructify'
require 'active_support/core_ext/string'

module RestApiValidation
class  Database
  attr_reader :data_dir, :data

  def initialize(data_dir:)
    @data_dir = data_dir
  end

  def fetch_data_for(model, params={})
    all_data = all_data_for(model)

    if params.empty?
      results = all_data
    else
      param, value = params.shift
      results      = all_data.select { |e| e[param.to_s] == value }
    end

    results
  end

  def fetch_ids_for(model, params={})
    Set.new fetch_data_for(model, params).map { |e| e['id'] }
  end

  def fetch_a(model, params={})
    fetch_data_for(model, params).first
  end

  def fetch_an_other(model)
    model_name       = normalize_model_name(model)
    model_name_other = normalize_model_name(model_name.to_s + '_other')
    data[model_name_other].first
  end

  def data
    @data ||= read_data
  end

  private

  def read_data
    data = {}
    files = Dir["#{data_dir}/*.json"]
    files.each do |file|
      model =File.basename(file, '.json')
      data[model.to_sym] = JSON.parse(File.read(file)).ostructify
    end
    data
  end

  def normalize_model_name(model)
    model.to_s.singularize.to_sym
  end

  def all_data_for(model)
    model_name       = normalize_model_name(model)
    model_name_other = normalize_model_name(model_name.to_s + '_other')
    data[model_name] + data[model_name_other]
  end

end
end
