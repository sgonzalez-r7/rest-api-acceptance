require 'spec_helper'

describe 'Array' do
  let(:input) { [
                  { 'attribute' =>  1 },
                  { 'attribute' =>  2 },
                  { 'attribute' =>  2 },
                  { 'attribute' =>  3 },
                  { 'attribute' => 'madlist'},
                  { 'attribute' => 'longlist'},
                ] }

  describe '#where' do
    context 'attribute key is a symbol' do
      it 'returns the correct element count' do
        output = input.where(attribute: 2)

        expect(output.count).to eql 2
      end

      it 'returns only elements with the given attribute' do
        output       = input.where(attribute: 2)
        values       = output.map { |e| e['attribute']}
        wrong_values = values.reject { |v| v == 2 }

        expect(wrong_values).to be_empty
      end
    end

    context 'attribute key is a string' do
      it 'returns the correct element count' do
        output = input.where("attribute" => 2)

        expect(output.count).to eql 2
      end

      it 'returns only elements with the given attribute' do
        output       = input.where('attribute' => 2)
        values       = output.map { |e| e['attribute']}
        wrong_values = values.reject { |v| v == 2 }

        expect(wrong_values).to be_empty
      end
    end
  end

  describe '#match' do
    context 'attribute key is a symbol' do
      it 'returns the correct element count' do
        output = input.match(attribute: 'list')

        expect(output.count).to eql 2
      end

      it 'returns only elements with the given attribute' do
        output       = input.match(attribute: 'list')
        values       = output.map { |e| e['attribute']}
        wrong_values = values.reject { |v| v.match('list') }

        expect(wrong_values).to be_empty
      end
    end

    context 'attribute key is a string' do
      it 'returns the correct element count' do
        output = input.match('attribute' => 'list')

        expect(output.count).to eql 2
      end

      it 'returns only elements with the given attribute' do
        output       = input.match('attribute' => 'list')
        values       = output.map { |e| e['attribute']}
        wrong_values = values.reject { |v| v.match('list') }

        expect(wrong_values).to be_empty
      end
    end
  end

end
