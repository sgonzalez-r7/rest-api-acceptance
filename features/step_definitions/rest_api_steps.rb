AN_INTEGER = Transform /^\d+$/ do |string|
  string.to_i
end

Given(/^the database has workspaces$/) do
end

When(/^the client requests GET (.*?)$/) do |path|
  @response = http_with_headers.get(base_uri + path)
end

Then(/^the status code is (#{AN_INTEGER})$/) do |code|
  expect(@response.code).to eql code
end
