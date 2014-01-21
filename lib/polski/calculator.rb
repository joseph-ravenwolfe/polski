module Polski
  class Calculator
    attr_accessor :history

    def initialize
      self.history = []
    end

    def push(expression)
      history << expression
    end

    def result
      stack = []
      history.each do |expression|
        if ['+', '-', '*', '/'].include?(expression)
          stack << perform_operation(expression, stack.pop(2))
        else
          stack << expression
        end
      end
      stack[-1]
    end

    private

    def perform_operation(expression, values)
      exp1, exp2 = values
      result = exp1.to_f.send(expression, exp2.to_f)
      result == result.to_i ? result.to_i : result
    end
  end
end
