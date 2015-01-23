
Given(/^a tester finds and notes a (\S+) that has (\S+)$/) do |parent, children|
  tester.find_and_note_parent_with_children(parent, children)
end

Given(/^the noted (\S+) belongs to a (\S+)$/) do |child, parent|
  tester.in_notes_find_parent_of_child(parent, child)
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
