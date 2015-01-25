#
# a resource that does NOT exist
#
Given(/^a (\S+) that does (NOT) exist$/) do |resource, arg|
  params["#{resource}_id".to_sym] = 999
end

#
# a child that does NOT belong to a parent
#
Given(/^a host that does NOT belong to a workspace$/) do
  workspace   = database.fetch_a(:workspace)

  host_other  = database.fetch_an_other(:host)

  params[:workspace_id] = workspace.id
  params[:host_id]      = host_other.id

  expect(host_other.workspace_id).to_not eql workspace.id
end
