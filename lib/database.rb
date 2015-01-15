class Database
  attr_reader :data, :models

  def initialize
  end

  def read_data(data_dir:, exclude: [])
    files = Dir["#{data_dir}/*"]

    @models = files.map do |file|
      File.basename(file, '.json').gsub(/s$/, '')
    end
    @models.reject! { |model| exclude.include? model }

    @data = JSON.parse(File.read(data_dir +  + '.json'))

  end

  def fetch_data(model)
  end

  private



  def normalize
    @json_database.sort! { |x,y| x['id'] <=> y['id'] }
  end
end
