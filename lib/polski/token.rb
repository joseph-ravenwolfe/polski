module Polski
  # Token acts as an interface layer between a Calculator and string
  # expressions. Strings can be parsed into multiple tokens and provide
  # conveniences like the ability to distinguish values from operators.
  #
  class Token < String
    def initialize(expression)
      super
    end

    def operator?
      Float.instance_methods(false).map(&:to_s).include?(self)
    end

    def division?
      self =~ /\//
    end

    def arity
      Float(0).method(self).arity + 1 if operator?
    end

    def self.parse(expression)
      expression.split.map { |e| new(e) }
    end
  end
end
