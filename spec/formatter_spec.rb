require 'spec_helper'

describe 'Formatter' do
  let(:mock_input) { [ {foo: 'bar', bar: 'baz', baz: 'foo'}, {foo: 'bar2', bar: 'baz2', baz: 'foo2'}, {foo: 'bar3', bar: 'baz3', baz: 'foo3'} ] }

  describe '#format' do
    it 'raises error message if format is not supported' do
      expect { Formatter.format(mock_input, 'foo') }.to raise_error('Formatter: invalid format')
    end

    it 'formats csv' do
      csv_mock = File.open('./spec/support/mock.csv').read
      result = Formatter.format(mock_input, 'csv')
      expect(result).to eq(csv_mock)
    end

    it 'formats json' do
      result = Formatter.format(mock_input, 'json')
      expect(result).to eq(JSON.generate(mock_input))
    end
  end
end