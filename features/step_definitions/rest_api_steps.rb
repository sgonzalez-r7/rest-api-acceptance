AN_INTEGER = Transform /^\d+$/ do |string|
  string.to_i
end

Given(/^a server with data$/) do
  @json_database = read_database
end

Given(/^a (\S+) that exists$/) do |resource|
  valid_resource = @json_database[resource + 's'].first
  self.instance_variable_set "@#{resource}_id", valid_resource['id']
end

Given(/^the (\S+) belongs to a (\S+)$/) do |child, parent|
  # we want to find the parent id (host) for the valid session
  index = @json_database[child + 's'].index do |i|
    i['id'] == self.instance_variable_get("@#{child}_id")
  end

  self.instance_variable_set "@#{parent}_id",
                             @json_database[child + 's'][index]["#{parent}_id"]
end

When(/^client generates (\S+) path for (\S+)$/) do |action, resource|
  resource.gsub! /s$/, ''
  @path = resource_path(workspace_id: @workspace_id,
                        host_id:      @host_id,
                        session_id:   @session_id,
                        note_id:      @note_id)[resource][action]
end

And(/^the client makes a (GET#(index|show)) request$/) do |request, action|
  @response = http_with_headers.get(base_uri + @path)
end

Then(/^the status code is (#{AN_INTEGER})$/) do |code|
  expect(@response.code).to eql code
end

And(/^the response is JSON$/) do
  @json_response = JSON.parse @response.to_s
end

And(/^it returns all (.*?) for the (.*?)$/) do |resource, parent|
  @json_response.sort! { |a, b| a['id'] <=> b['id'] }
  parent_id = self.instance_variable_get("@#{parent}_id")
  expect(@json_response).to eql @json_database[resource].select { |r| r["#{parent}_id"] == parent_id }
end




