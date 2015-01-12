AN_INTEGER = Transform /^\d+$/ do |string|
  string.to_i
end

When(/the client generates the base path/) do
  @path = '/base'
end

Given(/^the database has (.*?)$/) do |resource|
  @json_database = JSON.parse(File.read(data_dir + resource + '.json'))
  @json_database.sort! { |x,y| x['id'] <=> y['id']}  
end

And(/the client makes a GET request/) do
  @response = http_with_headers.get(base_uri + @path)
end

And(/the client uses an invalid token to make a GET request/) do
  @response = http_with_invalid_token.get(base_uri + @path)
end

Then(/^the status code is (#{AN_INTEGER})$/) do |code|
  expect(@response.code).to eql code
end

And(/the response is JSON/) do
  @json_response = JSON.parse @response.to_s
end

And(/it returns all (.*?) in the database/) do |resource|
  @json_response.sort! {|x,y| x['id'] <=> y['id']}
  expect(@json_response).to eql @json_database
end

And(/it returns the correct (.*?) in the database/) do |resource|
  expect(@json_response).to eql @json_database[@json_index]
end
