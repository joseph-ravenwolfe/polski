require_relative '../../../lib/polski'

describe Polski::Adapter::StringAdapter do
  describe '#initialize' do
    it 'utilizes a calculator' do
      calculator = Polski::Calculator.new
      adapter = Polski::Adapter::StringAdapter.new(calculator)
      adapter.calculator.should eq(calculator)
    end
  end

  describe '#<<' do
    it 'stores a value' do
      calculator = Polski::Calculator.new
      adapter = Polski::Adapter::StringAdapter.new(calculator)
      adapter.calculator.should_receive(:push)
      adapter << '12'
    end
  end
end
