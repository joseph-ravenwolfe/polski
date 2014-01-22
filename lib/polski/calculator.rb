module Polski
  class Calculator
    attr_accessor :tokens, :history

    def initialize
      self.tokens = []
      self.history = []
    end

    def push(expression)
      return rewind if expression =~ /rw/
      return fast_forward if expression =~ /ff/
      return clear if expression =~ /c/
      self.tokens += Polski::Token.tokenize(expression)
      self.history = []
    end

    def result
      stack = []
      tokens.each do |token|
        if token.operator?
          stack << apply(token, stack.pop(token.arity + 1))
        else
          stack << token
        end
      end
      stack.last
    end

    private

    def rewind
      history.unshift(tokens.pop) if tokens.any?
    end

    def fast_forward
      tokens.push(history.shift) if history.any?
    end

    def clear
      self.tokens = []
      self.history = []
    end

    def apply(operator, values)
      if values.size < operator.arity + 1
        values += Array.new(operator.arity + 1 - values.size).map(&:to_f)
      end
      target = values.shift.to_f
      result = target.send(operator, *values.map(&:to_f))
      result == result.to_i ? result.to_i : result
    end
  end
end
