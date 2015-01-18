require 'spec_helper'

module RestApiValidation
describe Tester do
  describe 'find_and_note_parent_with_children' do
    it 'finds an id of a parent with children' do
      tester    = Tester.new database: Database
      parent_id = tester.find_and_note_id_of_parent_with_children('host', 'sessions')
      expect(parent_id).to eql 116
    end

    it 'notes the parent id' do
      tester    = Tester.new database: Database
      expect(tester).to receive(:note).with(host_id: 116)
      parent_id = tester.find_and_note_id_of_parent_with_children('host', 'sessions')

    end
  end
end
end
