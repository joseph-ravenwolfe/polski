require_relative '../../../lib/polski'

describe Polski::Adapter::ConsoleAdapter do
  describe '#initialize' do
    it 'utilizes a calculator' do
      calculator = Polski::Calculator.new
      adapter = Polski::Adapter::ConsoleAdapter.new(calculator, false)
      adapter.calculator.should eq(calculator)
    end
  end
end
