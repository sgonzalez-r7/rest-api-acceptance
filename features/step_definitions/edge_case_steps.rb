#
# a resource that does NOT exist
#
Given(/^a (\S+) that does (NOT) exist$/) do |resource, arg|
  params["#{resource}_id".to_sym] = 999
end

