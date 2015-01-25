When(/^the client makes a (GET\#index) request for (\S+)$/) do |arg, resource_name|
  client.make_get_request :index, resource_name.to_sym, params
end

Then(/^the status code is (#{AN_INTEGER})$/) do |code|
  expect(client.last_response.code).to eql code
end

Then(/^it returns all (\S+) for the (\S+)$/) do |child_name, parent_name|
  ids      = json_to_ids(client.last_response.to_s)
  data_ids = database.fetch_ids_for(child_name.to_sym,
                                    "#{parent_name}_id".to_sym =>
                                      params["#{parent_name}_id".to_sym])
  expect(ids).to eql data_ids
end
