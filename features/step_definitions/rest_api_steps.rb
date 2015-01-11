AN_INTEGER = Transform /^\d+$/ do |string|
  string.to_i
end

Given(/^the database has (.*?)$/) do |resource|
  @json_database = JSON.parse(File.read(data_dir + resource + '.json'))
end

When(/^the client requests GET (.*?)$/) do |path|
  @response = http_with_headers.get(base_uri + path)
end

Then(/^the status code is (#{AN_INTEGER})$/) do |code|
  expect(@response.code).to eql code
end

And(/the response is JSON/) do
  @json_response = JSON.parse @response.to_s
end

And(/it returns all workspaces in the database/) do
  expect(@json_response).to eql @json_database
end

And(/it returns workspace with id (#{AN_INTEGER})/) do |id|
  expect(@json_response['id']).to eql id
end
