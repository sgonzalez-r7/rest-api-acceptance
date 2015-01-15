module Database
  def self.models
    {
      'key'       =>  { 'class' => ::Mdm::ApiKey    },
      'owner'     =>  { 'class' => ::Mdm::User      },
      'workspace' =>  { 'class' => ::Mdm::Workspace },
      'host'      =>  { 'class' => ::Mdm::Host      },
      'session'   =>  { 'class' => ::Mdm::Session   },
      'serivce'   =>  { 'class' => ::Mdm::Service   },
      'note'      =>  { 'class' => ::Mdm::Note,     },
      'vuln'      =>  { 'class' => ::Mdm::Vuln      },
      'web_site'  =>  { 'class' => ::Mdm::WebSite   },
      'web_form'  =>  { 'class' => ::Mdm::WebForm   },
      'web_page'  =>  { 'class' => ::Mdm::WebPage   },
      'web_vuln'  =>  { 'class' => ::Mdm::WebVuln   },

      'se_campaign'        =>  { 'class' => ::SocialEngineering::Campaign       },
      'se_web_page'        =>  { 'class' => ::SocialEngineering::WebPage        },
      'se_target_list'     =>  { 'class' => ::SocialEngineering::TargetList     },
      'se_email_template'  =>  { 'class' => ::SocialEngineering::EmailTemplate  },
      'se_email'           =>  { 'class' => ::SocialEngineering::Email          },
      'se_human_target'    =>  { 'class' => ::SocialEngineering::HumanTarget    },
      'se_email_opening'   =>  { 'class' => ::SocialEngineering::EmailOpening   },
      'se_phishing_result' =>  { 'class' => ::SocialEngineering::PhishingResult },
      'se_visit'           =>  { 'class' => ::SocialEngineering::Visit          },
    }
  end
end
