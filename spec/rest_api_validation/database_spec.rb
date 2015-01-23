require 'spec_helper'

module RestApiValidation
describe Database do
  let(:test_data_dir) { File.dirname(__FILE__) + '/../support/data' }

  describe '#fetch_data_for' do
    it 'fetches all data for a model' do
      database = Database.new data_dir: test_data_dir
      results  = database.fetch_data_for('hosts')
      data     = JSON.parse File.read("#{test_data_dir}/host.json")
      expect(results).to eq data
    end

    it 'fetches data with an attribute' do
      database = Database.new data_dir: test_data_dir
      host     = database.fetch_data_for('hosts', id: 2).first
      data     = JSON.parse <<-eod
        {
          "address": "192.168.0.5",
          "arch": null,
          "comm": null,
          "comments": null,
          "created_at": "2015-01-20T18:47:19Z",
          "cred_count": 0,
          "detected_arch": null,
          "exploit_attempt_count": 0,
          "history_count": 0,
          "host_detail_count": 0,
          "id": 2,
          "info": null,
          "mac": null,
          "name": "mdm_host_2",
          "nexpose_data_asset_id": null,
          "note_count": 0,
          "os_flavor": null,
          "os_lang": null,
          "os_name": null,
          "os_sp": null,
          "purpose": null,
          "scope": null,
          "service_count": 0,
          "state": null,
          "updated_at": "2015-01-20T18:47:19Z",
          "virtual_host": null,
          "vuln_count": 0,
          "workspace_id": 2
        }
      eod
      expect(host).to eql data
    end
  end

end
end
