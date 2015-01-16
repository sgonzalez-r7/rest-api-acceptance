require 'spec_helper'

describe Client do

  describe '#generate_index_path' do
    it 'generates index path for rest api' do
      client = Client.new
      path = client.generate_index_path workspace_id: 1,
                                        host_id:      2,
                                        resource:     'sessions'

      expect(path).to eql '/workspaces/1/hosts/2/sessions'
    end
  end

  describe '#generate_show_path' do
    it 'generates show path for rest api' do
      client = Client.new
      path = client.generate_show_path workspace_id: 1,
                                       host_id:      2,
                                       session_id:   3

      expect(path).to eql '/workspaces/1/hosts/2/sessions/3'
    end
  end

end
