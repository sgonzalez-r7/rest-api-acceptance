module RestApiValidation
class  Tester
  attr_reader :database

  def initialize(database:)
    @database = database
  end

  def find_and_note_id_of_parent_with_children(parent, children)
    child_name = children.singularize
    child      = database.fetch_data_for(child_name).first
    child[parent + '_id']
  end
end
end
