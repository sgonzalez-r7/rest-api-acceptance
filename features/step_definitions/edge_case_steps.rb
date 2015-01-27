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
  parent_obj       = database.fetch(parent).first
  child_other_obj  = database.fetch(child).match(model: "#{child}_other").first

  params["#{parent}_id"] = parent_obj['id']
  params["#{child}_id"]  = child_other_obj['id']

  expect(child_other_obj["#{parent}_id"]).to_not eql parent_obj['id']
end

#
# a child that does NOT belong to the parent
#
Given(/^a (\S+) that does (NOT) belong to the (\S+)$/) do |child, _not, parent|
  parent_obj       = database.fetch(parent).where(id: params["#{parent}_id"]).first
  child_other_obj  = database.fetch(child).match(model: "#{child}_other").first

  params["#{child}_id"]  = child_other_obj['id']

  expect(child_other_obj["#{parent}_id"]).to_not eql parent_obj['id']
end
