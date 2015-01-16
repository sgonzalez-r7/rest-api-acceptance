AN_INTEGER = Transform /^\d+$/ do |string|
  string.to_i
end
