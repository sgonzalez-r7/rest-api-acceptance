require 'spec_helper'

module RestApiValidation
describe Tester do
  describe 'find_and_note_parent_with_children' do
    it 'finds a parent with children' do
      tester    = Tester.new database: Database
      parent_id = tester.find_and_note_id_of_parent_with_children('host', 'sessions')
      expect(parent_id).to eql 116
    end
  end
end
end
