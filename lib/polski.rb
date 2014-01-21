require "polski/version"
require "polski/string_adapter"
require "polski/calculator"

module Polski
  def self.new_session
    StringAdapter.new(Calculator.new)
  end
end
