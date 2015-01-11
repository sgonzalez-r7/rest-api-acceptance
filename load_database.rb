require 'builder'

def models
  {
    'user'      =>  ::Mdm::User,
    'workspace' =>  ::Mdm::Workspace,
    'host'      =>  ::Mdm::Host,
    'session'   =>  ::Mdm::Session,
    'note'      =>  ::Mdm::Note,
    'serivce'   =>  ::Mdm::Service,
    'web_site'  =>  ::Mdm::WebSite,
    'web_form'  =>  ::Mdm::WebForm,
    'web_page'  =>  ::Mdm::WebPage,
    'web_vuln'  =>  ::Mdm::WebVuln,

    'se_campaign'        =>  ::SocialEngineering::Campaign,
    'se_web_page'        =>  ::SocialEngineering::WebPage,
    'se_email'           =>  ::SocialEngineering::Email,
    'se_email_opening'   =>  ::SocialEngineering::EmailOpening,
    'se_phishing_result' =>  ::SocialEngineering::PhishingResult,
    'se_visit'           =>  ::SocialEngineering::Visit
  }
end

# Empty database
models.keys.each { |model| models[model].delete_all }


# Mdm Main Objects
owner     = FactoryGirl.create :mdm_user

workspace = FactoryGirl.create :mdm_workspace,
                               owner_id: owner.id

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

se_tempate         = FactoryGirl.create :email_template,
                                        user_id:      owner.id,
                                        workspace_id: workspace.id

se_email           = FactoryGirl.create :social_engineering_email,
                                        user_id:        owner.id,
                                        campaign_id:    se_campaign.id,
                                        target_list_id: se_target_list.id,
                                        template_id:    se_tempate.id

se_human_target    = FactoryGirl.create :social_engineering_human_target,
                                        user_id: owner.id,
                                        workspace_id: workspace.id

se_email_opening   = FactoryGirl.create :social_engineering_email_opening,
                                        email_id: se_email.id,
                                        human_target_id: se_human_target.id

se_phishing_result = FactoryGirl.create :phishing_result,
                                         web_page_id: se_web_page.id,
                                         human_target_id: se_human_target.id

se_visit           = FactoryGirl.create :social_engineering_visit,
                                         web_page_id: se_web_page.id,
                                         email_id:    se_email.id,
                                         human_target_id: se_human_target.id


# Sets

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

se_tempates         = FactoryGirl.create_list :email_template, 2,
                                              user_id:      owner.id,
                                              workspace_id: workspace.id

se_emails           = FactoryGirl.create_list :social_engineering_email, 2,
                                             user_id:        owner.id,
                                             campaign_id:    se_campaign.id,
                                             target_list_id: se_target_list.id,
                                             template_id:    se_tempate.id

se_human_targets    = FactoryGirl.create_list :social_engineering_human_target, 2,
                                              user_id: owner.id,
                                              workspace_id: workspace.id

se_email_openings   = FactoryGirl.create_list :social_engineering_email_opening, 2,
                                              email_id: se_email.id,
                                              human_target_id: se_human_target.id

se_phishing_results = FactoryGirl.create_list :phishing_result, 2,
                                              web_page_id: se_web_page.id,
                                              human_target_id: se_human_target.id

se_visits           = FactoryGirl.create_list :social_engineering_visit, 2,
                                              web_page_id: se_web_page.id,
                                              email_id:    se_email.id,
                                              human_target_id: se_human_target.id



# Create database files for cucumber testing
def write_data_to(dir)
  key = FactoryGirl.create :api_key

  models.keys.each do |model|
    File.write( "#{dir}/" + "#{model}s" + '.json',
                JSON.pretty_generate(JSON.parse(models[model].all.to_json)))

    File.write( "#{dir}/" + "key" + '.json',
                JSON.pretty_generate(JSON.parse(key.to_json)))
  end
end







