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
        'hosts'      => "/workspaces/#{params[:workspace_id]}/hosts",
        'sessions'   => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:host_id]}/sessions",
        'notes'      => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:host_id]}/notes",
        'services'   => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:host_id]}/services",
        'vulns'      => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:host_id]}/services/#{params[:service_id]}/vulns",
        'web_sites'  => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:host_id]}/services/#{params[:service_id]}/web_sites",
        'web_forms'  => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:host_id]}/services/#{params[:service_id]}/web_sites/#{params[:web_site]}/web_forms",
        'web_pages'  => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:host_id]}/services/#{params[:service_id]}/web_sites/#{params[:web_site]}/web_pages",
        'web_vulns'  => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:host_id]}/services/#{params[:service_id]}/web_sites/#{params[:web_site]}/web_vulns",

        'se_campaigns'        => "/workspaces/#{params[:workspace_id]}/campaigns",
        'se_web_pages'        => "/workspaces/#{params[:workspace_id]}/campaigns/#{params[:se_campaign_id]}/web_pages",
        'se_emails'           => "/workspaces/#{params[:workspace_id]}/campaigns/#{params[:se_campaign_id]}/emails",
        'se_email_openings'   => "/workspaces/#{params[:workspace_id]}/campaigns/#{params[:se_campaign_id]}/email_openings",
        'se_phishing_results' => "/workspaces/#{params[:workspace_id]}/campaigns/#{params[:se_campaign_id]}/phishing_results",
        'se_visits'           => "/workspaces/#{params[:workspace_id]}/campaigns/#{params[:se_campaign_id]}/visits",
      },

      show: {
        'workspace' => "/workspaces/#{params[:id]}",
        'host'      => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:id]}",
        'session'   => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:host_id]}/sessions/#{params[:id]}",
        'note'      => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:host_id]}/notes/#{params[:id]}",
        'service'   => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:host_id]}/services/#{params[:id]}",
        'vuln'      => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:host_id]}/services/#{params[:service_id]}/vulns/#{params[:id]}",
        'web_site'  => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:host_id]}/services/#{params[:service_id]}/web_sites/#{params[:id]}",
        'web_form'  => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:host_id]}/services/#{params[:service_id]}/web_sites/#{params[:web_site]}/web_forms/#{params[:id]}",
        'web_page'  => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:host_id]}/services/#{params[:service_id]}/web_sites/#{params[:web_site]}/web_pages/#{params[:id]}",
        'web_vuln'  => "/workspaces/#{params[:workspace_id]}/hosts/#{params[:host_id]}/services/#{params[:service_id]}/web_sites/#{params[:web_site]}/web_vulns/#{params[:id]}",

        'se_campaign'        => "/workspaces/#{params[:workspace_id]}/campaigns/#{params[:id]}",
        'se_web_page'        => "/workspaces/#{params[:workspace_id]}/campaigns/#{params[:se_campaign_id]}/web_pages/#{params[:id]}",
        'se_email'           => "/workspaces/#{params[:workspace_id]}/campaigns/#{params[:se_campaign_id]}/emails/#{params[:id]}",
        'se_email_opening'   => "/workspaces/#{params[:workspace_id]}/campaigns/#{params[:se_campaign_id]}/email_openings/#{params[:id]}",
        'se_phishing_result' => "/workspaces/#{params[:workspace_id]}/campaigns/#{params[:se_campaign_id]}/phishing_results/#{params[:id]}",
        'se_visit'           => "/workspaces/#{params[:workspace_id]}/campaigns/#{params[:se_campaign_id]}/visits/#{params[:id]}",
      },
    }
  end

end
end
