require 'builder'

@data = {
  'key'       =>  [],  'workspace' =>  [],  'host'      =>  [],
  'session'   =>  [],  'service'   =>  [],  'note'      =>  [],
  'vuln'      =>  [],  'web_site'  =>  [],  'web_form'  =>  [],
  'web_page'  =>  [],  'web_vuln'  =>  [],

  'se_campaign'        =>  [],  'se_web_page'        =>  [],
  'se_target_list'     =>  [],  'se_email_template'  =>  [],
  'se_email'           =>  [],  'se_human_target'    =>  [],
  'se_email_opening'   =>  [],  'se_phishing_result' =>  [],
  'se_visit'           =>  [],
}

@other_data = {
  'key'       =>  [],  'workspace' =>  [],  'host'      =>  [],
  'session'   =>  [],  'service'   =>  [],  'note'      =>  [],
  'vuln'      =>  [],  'web_site'  =>  [],  'web_form'  =>  [],
  'web_page'  =>  [],  'web_vuln'  =>  [],

  'se_campaign'        =>  [],  'se_web_page'        =>  [],
  'se_target_list'     =>  [],  'se_email_template'  =>  [],
  'se_email'           =>  [],  'se_human_target'    =>  [],
  'se_email_opening'   =>  [],  'se_phishing_result' =>  [],
  'se_visit'           =>  [],
}

Models = [
  ::Mdm::User,     ::Mdm::Workspace,  ::Mdm::Host,
  ::Mdm::Session,  ::Mdm::Service,    ::Mdm::Note,
  ::Mdm::Vuln,     ::Mdm::WebSite,    ::Mdm::WebForm,
  ::Mdm::WebPage,  ::Mdm::WebVuln,

  ::SocialEngineering::Campaign,     ::SocialEngineering::WebPage,
  ::SocialEngineering::TargetList,   ::SocialEngineering::EmailTemplate,
  ::SocialEngineering::Email,        ::SocialEngineering::HumanTarget,
  ::SocialEngineering::EmailOpening, ::SocialEngineering::PhishingResult,
  ::SocialEngineering::Visit
]

Models.each { |model| model.delete_all }

def random_name
  (1..10).to_a.map{ ('a'..'z').to_a.sample }.join
end

# Mdm Main Objects
key       = FactoryGirl.create :api_key

owner     = FactoryGirl.create :mdm_user

workspace = FactoryGirl.create :mdm_workspace,
                                name: random_name,
                                owner_id: nil

host      = FactoryGirl.create :mdm_host,
                                workspace_id: workspace.id


session   = FactoryGirl.create :mdm_session,
                               host_id: host.id

service   = FactoryGirl.create :mdm_service,
                               host_id: host.id

note      = FactoryGirl.create :mdm_note,
                               workspace_id: workspace.id,
                               host_id:      host.id,
                               service_id:   service.id

vuln      = FactoryGirl.create :mdm_vuln,
                               host_id:    host.id,
                               service_id: service.id

# Mdm Web Objects
web_site  = FactoryGirl.create :mdm_web_site,
                               service_id: service.id

web_form  = FactoryGirl.create :mdm_web_form,
                               web_site_id: web_site.id

web_page  = FactoryGirl.create :mdm_web_page,
                               web_site_id: web_site.id

web_vuln  = FactoryGirl.create :mdm_web_vuln,
                               web_site_id: web_site.id


# Social Enginnering Objects
se_campaign        = FactoryGirl.create :configured_campaign,
                                        user_id:            owner.id,
                                        started_by_user_id: owner.id,
                                        workspace_id:       workspace.id

se_web_page        = FactoryGirl.create :social_engineering_web_page,
                                        campaign_id: se_campaign.id

se_target_list     = FactoryGirl.create :social_engineering_target_list,
                                        user_id:      owner.id,
                                        workspace_id: workspace.id

se_template        = FactoryGirl.create :email_template,
                                        user_id:      owner.id,
                                        workspace_id: workspace.id

se_email           = FactoryGirl.create :social_engineering_email,
                                        user_id:        owner.id,
                                        campaign_id:    se_campaign.id,
                                        target_list_id: se_target_list.id,
                                        template_id:    se_template.id

se_human_target    = FactoryGirl.create :social_engineering_human_target,
                                        user_id:      owner.id,
                                        workspace_id: workspace.id

se_email_opening   = FactoryGirl.create :social_engineering_email_opening,
                                        email_id:        se_email.id,
                                        human_target_id: se_human_target.id

se_phishing_result = FactoryGirl.create :phishing_result,
                                         web_page_id:     se_web_page.id,
                                         human_target_id: se_human_target.id

se_visit           = FactoryGirl.create :social_engineering_visit,
                                         web_page_id:     se_web_page.id,
                                         email_id:        se_email.id,
                                         human_target_id: se_human_target.id


# Populate data for single objects
@data['key']                << key
@data['workspace']          << workspace
@data['host']               << host
@data['session']            << session
@data['service']            << service
@data['note']               << note
@data['vuln']               << vuln
@data['web_site']           << web_site
@data['web_form']           << web_form
@data['web_page']           << web_page
@data['web_vuln']           << web_vuln
@data['se_campaign']        << se_campaign
@data['se_web_page']        << se_web_page
@data['se_target_list']     << se_target_list
@data['se_email_template']  << se_template
@data['se_email']           << se_email
@data['se_human_target']    << se_human_target
@data['se_email_opening']   << se_email_opening
@data['se_phishing_result'] << se_phishing_result
@data['se_visit']           << se_visit


# Collections

# Mdm Main Objects
workspaces = FactoryGirl.create_list :mdm_workspace, 2,
                                     owner_id: owner.id

hosts      = FactoryGirl.create_list :mdm_host, 2,
                                     workspace_id: workspace.id

sessions   = FactoryGirl.create_list :mdm_session, 2,
                                     host_id: host.id

services   = FactoryGirl.create_list :mdm_service, 2,
                                     host_id: host.id

notes      = FactoryGirl.create_list :mdm_note, 2,
                                     workspace_id: workspace.id,
                                     host_id:      host.id,
                                     service_id:   service.id

vulns      = FactoryGirl.create_list :mdm_vuln, 2,
                                     host_id:    host.id,
                                     service_id: service.id

# Mdm Web Objects
web_sites  = FactoryGirl.create_list :mdm_web_site, 2,
                                     service_id: service.id

web_forms  = FactoryGirl.create_list :mdm_web_form, 2,
                                     web_site_id: web_site.id

web_pages  = FactoryGirl.create_list :mdm_web_page, 2,
                                     web_site_id: web_site.id

web_vulns  = FactoryGirl.create_list :mdm_web_vuln, 2,
                                     web_site_id: web_site.id


# Social Enginnering Objects
se_campaigns        = FactoryGirl.create_list :configured_campaign, 2,
                                              user_id:            owner.id,
                                              started_by_user_id: owner.id,
                                              workspace_id:       workspace.id

se_web_pages        = FactoryGirl.create_list :social_engineering_web_page, 2,
                                              campaign_id: se_campaign.id

se_target_lists     = FactoryGirl.create_list :social_engineering_target_list, 2,
                                              user_id:      owner.id,
                                              workspace_id: workspace.id

se_templates        = FactoryGirl.create_list :email_template, 2,
                                              user_id:      owner.id,
                                              workspace_id: workspace.id

se_emails           = FactoryGirl.create_list :social_engineering_email, 2,
                                             user_id:        owner.id,
                                             campaign_id:    se_campaign.id,
                                             target_list_id: se_target_list.id,
                                             template_id:    se_template.id

se_human_targets    = FactoryGirl.create_list :social_engineering_human_target, 2,
                                              user_id:      owner.id,
                                              workspace_id: workspace.id

se_email_openings   = FactoryGirl.create_list :social_engineering_email_opening, 2,
                                              email_id:        se_email.id,
                                              human_target_id: se_human_target.id

se_phishing_results = FactoryGirl.create_list :phishing_result, 2,
                                              web_page_id:     se_web_page.id,
                                              human_target_id: se_human_target.id

se_visits           = FactoryGirl.create_list :social_engineering_visit, 2,
                                              web_page_id:     se_web_page.id,
                                              email_id:        se_email.id,
                                              human_target_id: se_human_target.id

# Populate data for collections
@data['workspace']          += workspaces
@data['host']               += hosts
@data['session']            += sessions
@data['service']            += services
@data['note']               += notes
@data['vuln']               += vulns
@data['web_site']           += web_sites
@data['web_form']           += web_forms
@data['web_page']           += web_pages
@data['web_vuln']           += web_vulns
@data['se_campaign']        += se_campaigns
@data['se_web_page']        += se_web_pages
@data['se_target_list']     += se_target_lists
@data['se_email_template']  += se_templates
@data['se_email']           += se_emails
@data['se_human_target']    += se_human_targets
@data['se_email_opening']   += se_email_openings
@data['se_phishing_result'] += se_phishing_results
@data['se_visit']           += se_visits


# Other models for checking scoping

# Mdm Main Objects Other
owner_other     = FactoryGirl.create :mdm_user

workspace_other = FactoryGirl.create :mdm_workspace,
                                      owner_id: owner_other.id

host_other      = FactoryGirl.create :mdm_host,
                                     workspace_id: workspace_other.id

session_other   = FactoryGirl.create :mdm_session,
                                     host_id: host_other.id

service_other   = FactoryGirl.create :mdm_service,
                                     host_id: host_other.id

note_other      = FactoryGirl.create :mdm_note,
                                     workspace_id: workspace_other.id,
                                     host_id:      host_other.id,
                                     service_id:   service_other.id

vuln_other      = FactoryGirl.create :mdm_vuln,
                                     host_id:    host_other.id,
                                     service_id: service_other.id

# Mdm Web Objects Other
web_site_other  = FactoryGirl.create :mdm_web_site,
                                     service_id: service_other.id

web_form_other  = FactoryGirl.create :mdm_web_form,
                                     web_site_id: web_site_other.id

web_page_other  = FactoryGirl.create :mdm_web_page,
                                     web_site_id: web_site_other.id

web_vuln_other  = FactoryGirl.create :mdm_web_vuln,
                                     web_site_id: web_site_other.id


# Social Enginnering Objects Other
se_campaign_other        = FactoryGirl.create :configured_campaign,
                                              user_id:            owner_other.id,
                                              started_by_user_id: owner_other.id,
                                              workspace_id:       workspace_other.id

se_web_page_other        = FactoryGirl.create :social_engineering_web_page,
                                              campaign_id: se_campaign_other.id

se_target_list_other     = FactoryGirl.create :social_engineering_target_list,
                                              user_id:      owner_other.id,
                                              workspace_id: workspace_other.id

se_template_other         = FactoryGirl.create :email_template,
                                              user_id:      owner_other.id,
                                              workspace_id: workspace_other.id

se_email_other           = FactoryGirl.create :social_engineering_email,
                                              user_id:        owner_other.id,
                                              campaign_id:    se_campaign_other.id,
                                              target_list_id: se_target_list_other.id,
                                              template_id:    se_template_other.id

se_human_target_other    = FactoryGirl.create :social_engineering_human_target,
                                              user_id:      owner_other.id,
                                              workspace_id: workspace_other.id

se_email_opening_other   = FactoryGirl.create :social_engineering_email_opening,
                                              email_id:        se_email_other.id,
                                              human_target_id: se_human_target_other.id

se_phishing_result_other = FactoryGirl.create :phishing_result,
                                              web_page_id:     se_web_page_other.id,
                                              human_target_id: se_human_target_other.id

se_visit_other           = FactoryGirl.create :social_engineering_visit,
                                              web_page_id:     se_web_page_other.id,
                                              email_id:        se_email_other.id,
                                              human_target_id: se_human_target_other.id


# Populate data for single "other" objects
@other_data['workspace']          << workspace_other
@other_data['host']               << host_other
@other_data['session']            << session_other
@other_data['service']            << service_other
@other_data['note']               << note_other
@other_data['vuln']               << vuln_other
@other_data['web_site']           << web_site_other
@other_data['web_form']           << web_form_other
@other_data['web_page']           << web_page_other
@other_data['web_vuln']           << web_vuln_other
@other_data['se_campaign']        << se_campaign_other
@other_data['se_web_page']        << se_web_page_other
@other_data['se_target_list']     << se_target_list_other
@other_data['se_email_template']  << se_template_other
@other_data['se_email']           << se_email_other
@other_data['se_human_target']    << se_human_target_other
@other_data['se_email_opening']   << se_email_opening_other
@other_data['se_phishing_result'] << se_phishing_result_other
@other_data['se_visit']           << se_visit_other


# Create database files for cucumber testing
def write_data(data_dir)
  @data.each_key do |model|
    File.write( "#{data_dir}/" + "#{model}" + '.json',
                JSON.pretty_generate(JSON.parse @data[model].to_json) )
  end

  @other_data.each_key do |model|
    File.write( "#{data_dir}/" + "#{model}_other" + '.json',
                JSON.pretty_generate(JSON.parse @other_data[model].to_json) )
  end
end
