#
# the client makes a GET#index request for resource
#
When(/^the client makes a (GET\#index) request for (\S+)$/) do |arg, resource_name|
  client.make_get_request :index, resource_name, params
end

#
# it returns all children for the parent
#
Then(/^it returns all (\S+) for the (\S+)$/) do |child, parent|
  ids       = Set.new json_to_ids(client.last_response.to_s)
  data_ids  = Set.new database.fetch_ids_for child, "#{parent}_id" => params["#{parent}_id"]

  expect(ids).to eql data_ids
end

#
# the client makes a GET#show request for resource
#
When(/^the client makes a (GET\#show) request for (\S+)$/) do |_get_show, resource|
  client.make_get_request :show, resource, params
end

#
# it returns the resource
#
Then(/^it returns the (\S+)$/) do |resource|
  resource_obj = JSON.parse(client.last_response.to_s)
  data_obj     = database.fetch_a resource, :id => params["#{resource}_id"]

  expect(resource_obj['id']).to eql data_obj['id']
end

#
# the status code is AN_INTEGER
#
Then(/^the status code is (#{AN_INTEGER})$/) do |code|
  expect(client.last_response.code).to eql code
end
