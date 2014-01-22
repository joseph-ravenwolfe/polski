module Polski
  # Calculator provides a Reverse Polish Notation interface to perform
  # calculations while maintaining all input history.
  #
  # Calendar is used indirectly by an Adapter. A customer Adapter will interact
  # with the Calculator by sending `push` and `result` messages.
  #
  class Calculator
    attr_accessor :tokens, :history

    def initialize
      self.tokens = []
      self.history = []
    end

    # Adds a Token to the stack. Performs universal commands such as `rewind`
    # and `fast_forward` when provided.
    #
    def push(expression)
      return rewind if expression =~ /rw/
      return fast_forward if expression =~ /ff/
      return clear if expression =~ /c/
      self.tokens += Polski::Token.parse(expression)
      self.history = []
    end

    # Evaluates all token expressions and yields a calculated result.
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
