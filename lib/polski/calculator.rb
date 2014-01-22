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
      self.tokens += Polski::Token.parse(expression)
      self.history = []
    end

    def result
      stack = []
      tokens.each do |token|
        if token.operator?
          operands = stack.pop(token.arity)
          stack << Polski::Calculation.new(token, operands).apply
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
  end
end
