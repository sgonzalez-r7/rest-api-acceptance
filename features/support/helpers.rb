module KnowsTheHelpers
  def json_to_ids(data)
    Set.new JSON.parse(data).map { |e| e['id'] }
  end
end

World(KnowsTheHelpers)
