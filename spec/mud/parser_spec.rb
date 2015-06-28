require 'spec_helper'

valid_strings = [
  '(move "left")',
  '((move "right")(move "down"))',
  '(run (go "left"))',
  '((move "left")(run (move "down")))',
  '(move 1)',
  '(move 1.1)'
]

invalid_strings = [
  'foo',
  '(foo "bar"',
  '(foo "bar")(baz "qux")'
]


describe Parser do
  let(:parser){Parser.new}

  valid_strings.each do |s|
    it "labels #{s} as valid" do
      expect(parser.parse!(s)).to be_kind_of(Array)
    end
  end

  invalid_strings.each do |s|
    it "labels #{s} as invalid" do
      expect{parser.parse!(s)}.to raise_error(ParsingError::InvalidStatement)
    end
  end

  it 'throws an error on unrecognised commands' do
    c = '(foo "bar")'
    expect{parser.parse!(c)}.to raise_error(ParsingError::InvalidCommand)
  end

  it 'throws an error on unrecognised contexts' do
    c = '(foo(run "bar"))'
    expect{parser.parse!(c)}.to raise_error(ParsingError::InvalidContext)
  end

end
