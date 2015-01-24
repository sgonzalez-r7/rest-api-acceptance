module KnowsTheDomain
  def client
    @client ||= RestApiValidation::Client.new rest_api: RestApiValidation::RestApi
  end

  def database
    data_dir    = File.dirname(__FILE__) + '/data'
    @database ||= RestApiValidation::Database.new data_dir: data_dir
  end

  def params
    @params ||= {}
  end
end

World(KnowsTheDomain)
