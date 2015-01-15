class Database
  attr_reader :models, :data

  def initialize(data_dir: '')
    load_data(data_dir: data_dir) unless data_dir.empty?
  end

  def load_data(data_dir:)
    files = Dir["#{data_dir}/*"]
    @models = []
    @data   = {}

    files.map do |file|
      model_name         = File.basename(file, '.json')
      model_data         = JSON.parse File.read(file)
      @models           << model_name
      @data[model_name]  = model_data
    end
  end

  def fetch_data_for(model, options={})
    key   = options.keys.first
    value = options[key]

    if options.empty?
      data[model]
    else
      data[model].select { |obj| obj[key.to_s] == value }
    end

  end

end
