When(/the client generates the (workspaces) path/) do |foo|
  @path = "/workspaces"
end

When(/the client uses a valid (workspace id)/) do |foo|
  random_index  = (0..@json_database.size-1).to_a.sample
  @json_index   = random_index
  @workspace_id = @json_database[@json_index]['id']
end

When(/the client uses an invalid (workspace id)/) do |foo|
  @workspace_id = '999'
end

When(/the client generates the (workspace) path/) do |foo|
  @path = "/workspaces/#{@workspace_id}"
end
