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

When(/^the client makes a (GET\#index) request$/) do |arg|
  client.make_get_request :index, 'sessions', params
end

Then(/^the status code is (#{AN_INTEGER})$/) do |code|
  expect(client.last_response.code).to eql code
end

And(/^it returns all sessions for the host$/) do
  ids = Set.new JSON.parse(client.last_response.to_s).map{ |e| e['id'] }
  expect(ids).to eql database.fetch_ids_for('sessions')
end

When(/^the client makes a (GET\#show) request$/) do |arg|
  ap params
  client.make_get_request :show, 'session', params
end

Then(/^it returns the session$/) do
  id = JSON.parse(client.last_response.to_s)['id']
  expect(id).to eql params[:session_id]
end

Given(/^a host that does NOT exist$/) do
  params[:host_id] = 999
end

Given(/^a workspace that exists$/) do
  id = database.fetch_data_for('workspaces').first['id']
  params[:workspace_id] = id
end

Given(/^a host that exists$/) do
  id = database.fetch_data_for('hosts').first['id']
  params[:host_id] = id
end

Given(/^a workspace that does NOT exist$/) do
  params[:workspace_id] = 999
end

Given(/^the host does NOT belong to a workspace$/) do
  id_other = database.fetch_data_for('workspace_other').first['id']
  params[:workspace_id] = id_other
end

Given(/^a session that does NOT exist$/) do
  params[:session_id] = 999
end

Given(/^a host that belongs to a workspace$/) do
  host = database.fetch_data_for('hosts').first
  params[:host_id]      = host['id']
  params[:workspace_id] = host['workspace_id']

  expect(params[:host_id]).to_not       be_nil
  expect(params[:workspace_id]).to_not  be_nil
end

Given(/^a session that exists$/) do
  id = database.fetch_data_for('sessions').first['id']
  params[:session_id] = id
end

Given(/^a session that does NOT belong to a host$/) do
  id = database.fetch_data_for('session_other').first['id']
  params[:session_id] = id
end











