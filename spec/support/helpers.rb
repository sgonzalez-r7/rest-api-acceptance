def to_set_of_ids(data)
  Set.new data.map { |e| e.id }
end

def load_data_for(resource)
  resource_name = resource.to_s.singularize
  file          = "#{test_data_dir}/#{resource_name}.json"
  other_file    = "#{test_data_dir}/#{resource_name}_other.json"
  data          = JSON.parse File.read(file)
  other_data    = JSON.parse File.read(other_file)
  data + other_data
end
