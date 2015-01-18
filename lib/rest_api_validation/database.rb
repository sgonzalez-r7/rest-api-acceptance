module RestApiValidation
class  Database
  def self.data_dir
    File.dirname(__FILE__) + '/../../features/support/data'
  end

  def self.fetch_data_for(model, params={})
    if params.empty?
      results = data[model]
    else
      k, v    = params.shift
      results = data[model].select { |model| model[k.to_s] == v }
    end
    results
  end

  private

  def self.data
    @data ||= read_data
  end

  def self.read_data
    files = Dir[data_dir + '/*.json']
    data = {}
    files.each do |file|
      model_name        = File.basename file, '.json'
      data[model_name] = JSON.parse File.read(file)
    end
    data
  end

end
end
