Given(/^a (\S+) that has a (\S+)$/) do |parent_name, child_name|
  parent = database.fetch_a(parent_name.to_sym)
  child  = database.fetch_a(child_name.to_sym,
                            "#{parent_name}_id".to_sym =>
                              parent.id)

  params["#{parent_name}_id".to_sym] = parent.id
  params["#{child_name}_id".to_sym]  = child.id

  expect(child["#{parent_name}_id"]).to eql parent.id
end


Given(/^the (\S+) has (\S+)$/) do |parent_name, child_name|
  parent   = database.fetch_a(parent_name.to_sym,
                              id: params["#{parent_name}_id".to_sym])

  children = database.fetch_data_for(child_name.to_sym,
                                     "#{parent_name}_id".to_sym =>
                                       parent.id)

  expect(children.count).to be > 0
end

Given(/^a (\S+) that exists$/) do |resource_name|
  resource = database.fetch_a(resource_name.to_sym)
  params[resource_name.to_sym] = resource.id
end


Given(/^a (\S+) that does (NOT) exist$/) do |resource, arg|
  params["#{resource}_id".to_sym] = 999
end


Given(/^a (\S+) that has (\S+)$/) do |parent_name, child_name|
  parent   = database.fetch_a("#{parent_name}".to_sym)
  children = database.fetch_data_for("#{child_name}".to_sym,
                                     "#{parent_name}_id".to_sym =>
                                       parent.id)

  params["#{parent_name}_id".to_sym] = parent.id

  expect(children.count).to be > 0
end
