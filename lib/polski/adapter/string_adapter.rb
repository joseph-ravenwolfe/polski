module Polski
  module Adapter
    # The String Adapter acts as a Ruby String interface to the Polski
    # calculator. It provides Array-like push functionality to the calculator
    # and returns calculated results.
    #
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
