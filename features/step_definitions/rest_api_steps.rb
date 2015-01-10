Given(/^the database has workspaces$/) do
end

When(/^I make an index get request$/) do
  @response = http_with_header.get("#{base_uri}/workspaces")
  @code     = @response.code
  @json     = JSON.parse @response.to_s
end

Then(/^I should receive status "([^"]+)"$/) do |code|
  expect(@code).to eql 200
end

Then(/^I should see all the workspaces$/) do
  expect(@json.size).to eql 3
end
