require "polski/version"
require "polski/adapter/string_adapter"
require "polski/calculator"
require "polski/token"

module Polski
  def self.session(adapter = Adapter::StringAdapter)
    adapter.new(Calculator.new)
  end
end
