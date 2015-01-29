Given(/^a valid api key$/) do
end

Given(/^an (INVALID) api key$/) do |invalid|
  RestApiValidation::RestApi.key = 'notavalidkey'
end

When(/^the client makes a base request$/) do
  client.make_get_request :index, :workspaces, path: '/base'
end

#
# the client makes a GET#index request for resource
#
When(/^the client makes a (GET\#index) request for (\S+)$/) do |arg, resource|
  client.make_get_request :index, resource, params
  ap client.path
end

#
# it returns all children for the parent
#
Then(/^it returns all (\S+) for the (\S+)$/) do |child, parent|
  ids      = Set.new json_to_ids(client.last_response.to_s)
  data     = database.fetch(child).where("#{parent}_id" => params["#{parent}_id"])
  data_ids = Set.new data.map { |e| e['id'] }

  expect(ids).to eql data_ids
end

#
# the client makes a GET#show request for resource
#
When(/^the client makes a (GET\#show) request for (\S+)$/) do |_get_show, resource|
  client.make_get_request :show, resource, params
  ap client.path
end

#
# it returns the resource
#
Then(/^it returns the (\S+)$/) do |resource|
  resource_obj = JSON.parse(client.last_response.to_s)
  data_obj     = database.fetch(resource).where(id: params["#{resource}_id"]).first

  expect(resource_obj['id']).to eql data_obj['id']
end

#
# the status code is AN_INTEGER
#
Then(/^the status code is (#{AN_INTEGER})$/) do |code|
  expect(client.last_response.code).to eql code
end
