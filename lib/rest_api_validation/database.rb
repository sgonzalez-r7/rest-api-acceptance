module RestApiValidation
class  Database
  attr_reader :data_dir, :data

  def initialize(data_dir:)
    @data_dir = data_dir
  end

  def fetch_data_for(model, params={})
    model_name = model.singularize
    if params.empty?
      results = data[model_name]
    else
      param, value = params.shift
      results      = data[model_name].select { |e| e[param.to_s] == value }
    end
    results
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
      data[model] = JSON.parse File.read(file)
    end
    data
  end

end
end
