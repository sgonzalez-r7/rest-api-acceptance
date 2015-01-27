#
# a parent that has a child
#
Given(/^a (\S+) that has a (\S+)$/) do |parent, child|
  parent_obj = database.fetch(parent).first
  child_obj  = database.fetch(child).where("#{parent}_id" => parent_obj['id']).first

  params["#{parent}_id"] = parent_obj['id']
  params["#{child}_id"]  = child_obj['id']

  expect(child_obj["#{parent}_id"]).to eql parent_obj['id']
end

#
# the parent has a child
#
Given(/^the (\S+) has a (\S+)$/) do |parent, child|
  parent_obj = database.fetch(parent).where(:id  => params["#{parent}_id"]).first
  child_obj  = database.fetch(child).where("#{parent}_id" => parent_obj['id']).first

  params["#{child}_id"] = child_obj['id']

  expect(child_obj["#{parent}_id"]).to eql parent_obj['id']
end

#
# a parent that has children
#
Given(/^a (\S+) that has (\S+)$/) do |parent, child|
  parent_obj   = database.fetch(parent).first
  children_obj = database.fetch(child).where("#{parent}_id" => parent_obj['id'])

  params["#{parent}_id"] = parent['id']

  expect(children_obj.count).to be > 0
end

#
# the parent has children
#
Given(/^the (\S+) has (\S+)$/) do |parent, child|
  parent_obj   = database.fetch(parent).where(id: params["#{parent}_id"]).first
  children_obj = database.fetch(child).where("#{parent}_id" => parent_obj['id'])

  expect(children_obj.count).to be > 0
end

#
# a resource that exists
#
Given(/^a (\S+) that exists$/) do |resource|
  resource_obj = database.fetch(resource).first

  params["#{resource}_id"] = resource_obj['id']

  expect(resource_obj).to_not be_nil
end
