module Polski
  module Adapter
    class StringAdapter
      attr_accessor :calculator

      def initialize(calculator)
        self.calculator = calculator
      end

      def <<(expression)
        calculator.push(expression)
        calculator.result
      end

      def result
        calculator.result
      end
    end
  end
end
