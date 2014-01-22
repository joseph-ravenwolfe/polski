module Polski
  # Calculation stores mathematical expressions and yields the result of those
  # expressions when commanded.
  #
  class Calculation
    attr_accessor :target, :operator, :operands

    def initialize(operator, values)
      self.operator = operator
      self.operands = operands_for(values)
      self.target = operands.shift
    end

    # Performs a calculation based on the element's operators and operands and
    # yields the result.
    #
    def apply
      if operator.division? && operands.all?(&:zero?)
        warn "Can't divide #{target} by zero. Consider rewinding."
        return 0
      end
      result = target.send(operator, *operands)
      result == result.to_i ? result.to_i : result
    end

    private

    def operands_for(operands)
      if operands.size < operator.arity
        operands_missing = operator.arity - operands.size
        operands += Array.new operands_missing
      end
      operands.map(&:to_f)
    end
  end
end
