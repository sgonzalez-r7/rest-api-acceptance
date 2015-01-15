require 'spec_helper'

describe Database do
  let(:data_dir) { File.dirname(__FILE__) + '/' + '../features/data' }

  describe '#read_data' do
    it 'captures all the models' do
      database = Database.new
      database.read_data(data_dir: data_dir)
      valid_model_names = Set.new %w[ host         se_email_opening
                                      key          se_email
                                      note         se_phishing_result
                                      se_campaign  se_visit
                                      se_web_page  web_form
                                      serivce      web_page
                                      session      web_site
                                      user         web_vuln
                                      workspace ]

      expect(Set.new database.models).to eql valid_model_names
    end

    it 'excludes models' do
      database = Database.new
      database.read_data(data_dir: data_dir, exclude: %w[key])
      valid_model_names = Set.new %w[ host         se_email_opening
                                      workspace    se_email
                                      note         se_phishing_result
                                      se_campaign  se_visit
                                      se_web_page  web_form
                                      serivce      web_page
                                      session      web_site
                                      user         web_vuln ]

      expect(Set.new database.models).to eql valid_model_names
    end
  end

  # describe '#get_data' do
  #   it 'fetches the data'
  # end
end
