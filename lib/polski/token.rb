module Polski
  class Token < String
    def initialize(expression)
      super(expression)
    end

    def operator?
      ['+', '-', '*', '/'].include?(self)
    end

    def arity
      operator? ? Float(0).method(self).arity : 0
    end

    def self.tokenize(expression)
      expression.split.map { |e| new(e) }
    end
  end
end
