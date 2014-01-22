module Polski
  class Calculation
    attr_accessor :target, :operator, :operands

    def initialize(operator, values)
      self.operator = operator
      self.operands = operands_for(values)
      self.target = operands.shift
    end

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
