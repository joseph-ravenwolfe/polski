require_relative '../../lib/polski'

describe Polski::Token do
  describe '#operator?' do
    it 'returns true for a basic operator' do
      token = Polski::Token.new('+')
      token.operator?.should be_true
    end

    it 'returns true for a complex operator' do
      token = Polski::Token.new('ceil')
      token.operator?.should be_true
    end

    it 'returns false for a non operator' do
      token = Polski::Token.new('foo')
      token.operator?.should be_false
    end
  end

  describe '#division?' do
    it 'return true for a division operator' do
      token = Polski::Token.new('/')
      token.division?.should be_true
    end

    it 'return false for any other operator' do
      token = Polski::Token.new('+')
      token.division?.should be_false
    end
  end

  describe '#arity' do
    it 'it returns the operator arity' do
      token = Polski::Token.new('/')
      token.arity.should eq(2)
    end

    it 'returns nil for a non operator' do
      token = Polski::Token.new('a')
      token.arity.should be_nil
    end
  end

  describe '.parse' do
    it 'parses a string into several tokens' do
      tokens = Polski::Token.parse('2 + 4')
      tokens.size.should eq(3)
    end
  end
end
