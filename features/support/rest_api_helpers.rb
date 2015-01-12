module FileHelpers
  def data_dir
    File.dirname(__FILE__) + '/../data/'
  end
end
World(FileHelpers)

module DataBaseHelpers
  def read_database
    resources = Dir["#{data_dir}/*"].map do |file|
      File.basename(file, '.json')
    end.reject! { |r| r == 'key' }

    database = {}
    resources.each do |resource|
      database[resource] = JSON.parse(File.read(data_dir + resource + '.json'))
      # ap "database[resource] #{database[resource].class}"
      database[resource].sort! { |a,b| a['id'] <=> b['id']}

    end

    database
  end
end
World(DataBaseHelpers)

module ResourceHelpers
  def resource_path(workspace_id: '',
                    host_id:      '',
                    session_id:   '',
                    note_id:      '')
    {
      'workspace' => {
        'index' => "/workspaces",
        'show'  => "/workspace/#{workspace_id}"
      },
      'host' => {
        'index' => "/workspaces/#{workspace_id}/hosts",
        'show'  => "/workspace/#{workspace_id}/hosts/#{host_id}"
      },
      'session' => {
        'index' => "/workspaces/#{workspace_id}/hosts/#{host_id}/sessions",
        'show'  => "/workspace/#{workspace_id}/hosts/#{host_id}/sessions/#{session_id}"
      },
    }
  end
end
World(ResourceHelpers)


module RestApiHelpers
  include FileHelpers

  def base_uri
    'http://0.0.0.0:5000/rest_api/v2'
  end

  def token
    json_key = JSON.parse File.read(data_dir + 'key.json')
    json_key['token']
  end

  def http_with_headers
    HTTP.with(accept: 'application/json', 'Token' => token)
  end

  def http_with_invalid_token
    HTTP.with(accept: 'application/json', 'Token' => 'notavalidtoken')
  end
end
World(RestApiHelpers)
