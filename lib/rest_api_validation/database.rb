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
    model_name = normalize_model_name(model)
    if params.empty?
      results = data[model_name]
    else
      param, value = params.shift
      results      = data[model_name].select { |e| e[param.to_s] == value }
    end
    results
  end

  def fetch_ids_for(model)
    Set.new fetch_data_for(model).map { |e| e['id'] }
  end

  def fetch_a(model, params={})
    model_name = normalize_model_name(model)
    if params.empty?
      result = data[model_name]
    else
      param, value = params.shift
      result = data[model_name].select { |e| e[param.to_s] == value }
    end
    result.first
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

end
end
