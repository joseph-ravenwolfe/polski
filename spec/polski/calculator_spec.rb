require_relative '../../lib/polski'

describe Polski::Calculator do
  describe '#initialize' do
    it 'begins with empty tokens' do
      calculator = Polski::Calculator.new
      calculator.tokens.should be_empty
    end

    it 'begins with empty history' do
      calculator = Polski::Calculator.new
      calculator.history.should be_empty
    end
  end

  describe '#push' do
    it 'adds a token' do
      calculator = Polski::Calculator.new
      calculator.push('5')
      calculator.tokens.size.should eq(1)
    end
  end
end
