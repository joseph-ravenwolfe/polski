require_relative '../../lib/polski'

describe Polski::StringAdapter do
  it 'utilizes a calculator' do
    calculator = Polski::Calculator.new
    adapter = Polski::StringAdapter.new(calculator)
    adapter.calculator.should eq(calculator)
  end

  it 'receives a pushed input' do
    calculator = Polski::Calculator.new
    adapter = Polski::StringAdapter.new(calculator)
    adapter.calculator.should_receive(:push)
    adapter << '12'
  end
end
