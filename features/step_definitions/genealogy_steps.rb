#
# a parent that has a child
#
Given(/^a (\S+) that has a (\S+)$/) do |parent_name, child_name|
  parent = database.fetch_a(parent_name.to_sym)

  child  = database.fetch_a(child_name.to_sym,
                            "#{parent_name}_id".to_sym =>
                              parent.id)

  params["#{parent_name}_id".to_sym] = parent.id
  params["#{child_name}_id".to_sym]  = child.id

  expect(child["#{parent_name}_id"]).to eql parent.id
end

#
# the parent has a child
#
Given(/^the (\S+) has a (\S+)$/) do |parent_name, child_name|
  parent  = database.fetch_a(parent_name.to_sym,
                               id: params["#{parent_name}_id".to_sym])

  child   = database.fetch_a(child_name.to_sym,
                             "#{parent_name}_id".to_sym =>
                               parent.id)

  params["#{child_name}_id".to_sym] = child.id

  expect(child["#{parent_name}_id"]).to eql parent.id
end

#
# a parent that has children
#
Given(/^a (\S+) that has (\S+)$/) do |parent_name, child_name|
  parent   = database.fetch_a("#{parent_name}".to_sym)

  children = database.fetch_data_for("#{child_name}".to_sym,
                                     "#{parent_name}_id".to_sym =>
                                       parent.id)

  params["#{parent_name}_id".to_sym] = parent.id

  expect(children.count).to be > 0
end

#
# the parent has children
#
Given(/^the (\S+) has (\S+)$/) do |parent_name, child_name|
  parent   = database.fetch_a(parent_name.to_sym,
                              id: params["#{parent_name}_id".to_sym])

  children = database.fetch_data_for(child_name.to_sym,
                                     "#{parent_name}_id".to_sym =>
                                       parent.id)
  expect(children.count).to be > 0
end

#
# a resource that exists
#
Given(/^a (\S+) that exists$/) do |resource_name|
  resource = database.fetch_a(resource_name.to_sym)
  params["#{resource_name}_id".to_sym] = resource.id
  expect(resource).to_not be_nil
end
