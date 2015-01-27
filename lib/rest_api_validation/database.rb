require 'set'
require 'json'
require 'active_support/core_ext/string'
require 'array/extensions'

module RestApiValidation
class  Database
  attr_reader :data_dir, :data

  def initialize(data_dir:)
    @data_dir = data_dir
  end

  def fetch(model)
    all_data_for(model)
  end

  def data
    @data ||= read_data
  end

  private

  def read_data
    data = {}
    files = Dir["#{data_dir}/*.json"]
    files.each do |file|
      model = File.basename(file, '.json')
      json  = JSON.parse File.read(file)

      json.each { |e| e['model'] = model }

      data[model.to_sym] = json
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
