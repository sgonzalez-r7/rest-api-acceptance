require 'spec_helper'

module RestApiValidation
describe Client do
  describe '#make_get_request' do
    it 'makes a get request to the rest api' do
      client = Client.new rest_api: RestApi
      expect(client).to receive(:generate_path_for).and_return('/base')
      response = client.make_get_request(:index, 'workspaces')
      expect(response.code).to eql 200
    end
  end

  describe '#generate_path_for' do
    it 'generates the index path for workspaces' do
      client = Client.new rest_api: RestApi
      expect(client.generate_path_for(:index, 'workspaces')).to eql '/workspaces'
    end

    it 'generates the index path for hosts' do
      client = Client.new rest_api: RestApi
      expect(client.generate_path_for(:index, 'hosts', workspace_id: 42)).to eql '/workspaces/42/hosts'
    end

    context 'order of params: :id, :workspace_id' do
      it 'generates the show path for hosts' do
        client = Client.new rest_api: RestApi
        expect(client.generate_path_for(:show, 'host', id: 21, workspace_id: 42)).to eql '/workspaces/42/hosts/21'
      end
    end

    context 'order of params: :workspace_id, :id' do
      it 'generates the show path for hosts' do
        client = Client.new rest_api: RestApi
        expect(client.generate_path_for(:show, 'host', workspace_id: 42, id: 21)).to eql '/workspaces/42/hosts/21'
      end
    end
  end

end
end
