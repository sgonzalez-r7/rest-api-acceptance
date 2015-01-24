Given(/^a host that has sessions$/) do
  session           = database.fetch_data_for('sessions').first
  params[:host_id] = session['host_id']

  expect(params[:host_id]).to_not be_nil
end

Given(/^a session that belongs to a host$/) do
  session = database.fetch_data_for('sessions').first
  params[:session_id] = session['id']
  params[:host_id]    = session['host_id']

  expect(params[:session_id]).to_not be_nil
  expect(params[:host_id]).to_not    be_nil
end

Given(/^the host belongs to a workspace$/) do
  host = database.fetch_data_for('host', id: params[:host_id]).first
  params[:workspace_id] = host['workspace_id']
  expect(params[:workspace_id]).to_not be_nil
end

When(/^the client makes a GET\#index request$/) do
  client.make_get_request :index, 'sessions', params
end

Then(/^the status code is (#{AN_INTEGER})$/) do |code|
  expect(client.last_response.code).to eql code
end

And(/^it returns all sessions for the host$/) do
  expect(JSON.parse client.last_response).to eql database.fetch_data_for('sessions')
end



When(/^the client makes a GET\#show request$/) do
  client.make_get_request :show, 'session', params
end

Then(/^it returns the session$/) do
  expect(JSON.parse client.last_response).to eql database.fetch_data_for('session', id: params[:session_id]).first
end








