Given(/^a (\S+) that has (\S+)$/) do |parent, children|
  client.find_parent_with_children(parent, children)
end

Given(/^the (\S+) belongs to a (\S+)$/) do |child, parent|
 client.find_child_of_parent(child, parent)
end

When(/^the client generates the index path for sessions$/) do
  client.generate_index_path
end

When(/^the client makes a GET\#index request$/) do
  client.make_get_request
end

Then(/^the status code is (\d+)$/) do |code|
  expect(reponse.code).to eql code
end

Then(/^the response is JSON$/) do
end

Then(/^it returns all sessions for the host$/) do
end
