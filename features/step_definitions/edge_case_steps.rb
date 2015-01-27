#
# a resource that does NOT exist
#
Given(/^a (\S+) that does (NOT) exist$/) do |resource, _not|
  params["#{resource}_id"] = 999
end

#
# a child that does NOT belong to a parent
#
Given(/^a (\S+) that does (NOT) belong to a (\S+)$/) do |child, _not, parent|
  parent_obj       = database.fetch_a        parent
  child_other_obj  = database.fetch_an_other child

  params["#{parent}_id"] = parent_obj['id']
  params["#{child}_id"]  = child_other_obj['id']

  expect(child_other_obj["#{parent}_id"]).to_not eql parent_obj['id']
end

#
# a child that does NOT belong to the parent
#
Given(/^a (\S+) that does (NOT) belong to the (\S+)$/) do |child, _not, parent|
  parent_obj       = database.fetch_a        parent, :id => params["#{parent}_id"]
  child_other_obj  = database.fetch_an_other child

  params["#{child}_id"]  = child_other_obj['id']

  expect(child_other_obj["#{parent}_id"]).to_not eql parent_obj['id']
end
