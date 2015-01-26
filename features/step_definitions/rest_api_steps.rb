#
# the client makes a GET#index request for resource
#
When(/^the client makes a (GET\#index) request for (\S+)$/) do |arg, resource_name|
  client.make_get_request :index, resource_name.to_sym, params
end

#
# it returns all children for the parent
#
Then(/^it returns all (\S+) for the (\S+)$/) do |child_name, parent_name|
  ids      = Set.new json_to_ids(client.last_response.to_s)

  data_ids = database.fetch_ids_for(child_name.to_sym,
                                    "#{parent_name}_id".to_sym =>
                                      params["#{parent_name}_id".to_sym])
  expect(ids).to eql Set.new data_ids
end

#
# the client makes a GET#show request for resource
#
When(/^the client makes a (GET\#show) request for (\S+)$/) do |arg, resource_name|
  client.make_get_request :show, resource_name.to_sym, params
end

#
# it returns the resource
#
Then(/^it returns the (\S+)$/) do |resource_name|
  resource = JSON.parse(client.last_response.to_s).ostructify

  data     = database.fetch_a(resource_name.to_sym,
                              id: params["#{resource_name}_id".to_sym])

  expect(resource.id).to eql data.id
end

#
# the status code is AN_INTEGER
#
Then(/^the status code is (#{AN_INTEGER})$/) do |code|
  expect(client.last_response.code).to eql code
end
