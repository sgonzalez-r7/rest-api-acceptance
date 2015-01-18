module RestApiValidation
class  Tester
  attr_reader :database

  def initialize(database:)
    @database = database
    @notes    = {}
  end

  def find_and_note_id_of_parent_with_children(parent, children)
    child_name = children.singularize
    child      = database.fetch_data_for(child_name).first
    param      = parent + '_id'
    parent_id  = child[param]
    note(param.to_sym => parent_id)
    parent_id
  end

  private

  def note(params)
    k, v = params.shift
    @notes[k] = v
  end
end
end
