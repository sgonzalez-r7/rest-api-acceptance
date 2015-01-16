module KnowsTheDomain
  def database
    data_dir = File.dirname(__FILE__) + '/' + 'data'
    @database ||= Database.new data_dir: data_dir
  end

  def client
    @client ||= Client.new
  end
end

World(KnowsTheDomain)
