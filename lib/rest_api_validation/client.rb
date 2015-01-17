require 'http'

module RestApiValidation
class  Client
  attr_reader :rest_api

  def initialize(rest_api:)
    @rest_api = rest_api
  end


  def make_get_request(action, resource, params={})
    key      = rest_api.key
    base_uri = rest_api.base_uri
    path     = generate_path_for(action, resource, params)

    HTTP.with(accept: 'application/json',
                      'Token' => key).get(base_uri + path)
  end

  def generate_path_for(action, resource, params={})
    path_template(params)[action][resource]
  end

  private

  def path_template(params={})
    {
      index: {
        'workspaces' => "/workspaces",
        'hosts'      => "/workspaces/#{params[:workspace_id]}/hosts"
      },
      show: {
        'workspace'  => "/workspaces/#{params[:id]}",
        'host'       => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:id]}"
      },
    }
  end

end
end
