When(/the client generates the (hosts) path/) do |foo|
  @path = "/workspaces/#{@workspace_id}/hosts"
end

When(/the client generates the (host) path/) do |foo|
  @path = "/workspaces/#{@workspace_id}/hosts/#{@host_id}"
end

When(/the client uses a valid host that belongs to a valid workspace/) do
  random_index  = (0..@json_database.size-1).to_a.sample
  @json_index = random_index
  @host_id = @json_database[@json_index]['id']
  @workspace_id = @json_database[@json_index]['workspace_id']
end