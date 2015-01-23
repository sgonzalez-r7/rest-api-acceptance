require 'spec_helper'

module RestApiValidation
describe Tester do
  describe 'find_and_note_id_of_parent_with_children' do
    it 'finds an id of a parent with children' do
      tester = Tester.new database: Database
      tester.find_and_note_id_of_parent_with_children('host', 'sessions')
      expect(tester.notes(:host_id)).to eql 116
    end

    it 'notes the parent id' do
      tester    = Tester.new database: Database
      expect(tester).to receive(:note).with(host_id: 116)
      parent_id = tester.find_and_note_id_of_parent_with_children('host', 'sessions')
    end
  end

  describe 'find_and_note_parent_id_of_child' do
    it 'finds the parent id of a child' do
      tester = Tester.new database: Database
      tester.find_and_note_parent_id_of_child('workspace', host_obj)
    end
  end
end
end
