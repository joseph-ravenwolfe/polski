require_relative '../lib/polski'

describe 'Performing RPN calculations' do
  it 'sums 5 and 8' do
    calc = Polski.new_session
    calc << '5'
    calc << '8'
    calc << '+'
    calc.result.should eq(13)
  end

  it 'multiplies 2 by 3 and add 5' do
    calc = Polski.new_session
    calc << '-3'
    calc << '-2'
    calc << '*'
    calc.result.should eq(6)
    calc << '5'
    calc << '+'
    calc.result.should eq(11)
  end

  it 'sums 3 with 9 and multiplies by 2' do
    calc = Polski.new_session
    calc << '2'
    calc << '9'
    calc << '3'
    calc << '+'
    calc.result.should eq(12)
    calc << '*'
    calc.result.should eq(24)
  end

  it 'subtracts 20 by 13 and divides by 2' do
    calc = Polski.new_session
    calc << '20'
    calc << '13'
    calc << '-'
    calc.result.should eq(7)
    calc << '2'
    calc << '/'
    calc.result.should eq(3.5)
  end
end
