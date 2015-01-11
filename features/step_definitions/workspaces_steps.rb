When(/the client determines the correct (workspaces) path/) do |resource|
  @path = "/workspaces"
end

When(/the client determines the correct (workspace) path/) do |resource|
  random_index = (0..@json_database.size-1).to_a.sample
  @json_index  = random_index
  json_id      = @json_database[@json_index]['id']
  @path        = "/workspaces/#{json_id}"
end

When(/the client choses an invalid (workspace)/) do |resource|
  @path = "/workspace/999"
end
