#
# a resource that does NOT exist
#
Given(/^a (\S+) that does (NOT) exist$/) do |resource_name, arg|
  params["#{resource_name}_id".to_sym] = 999
end

#
# a child that does NOT belong to a parent
#
Given(/^a (\S+) that does (NOT) belong to a (\S+)$/) do |child_name, arg, parent_name|
  parent       = database.fetch_a("#{parent_name}".to_sym)
  child_other  = database.fetch_an_other("#{child_name}".to_sym)

  params["#{parent_name}_id".to_sym] = parent.id
  params["#{child_name}_id".to_sym]  = child_other.id

  expect(child_other["#{parent_name}_id"]).to_not eql parent.id
end
