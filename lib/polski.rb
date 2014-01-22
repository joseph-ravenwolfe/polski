require "polski/version"
require "polski/configuration"
require "polski/adapter/string_adapter"
require "polski/adapter/console_adapter"
require "polski/calculator"
require "polski/calculation"
require "polski/token"

module Polski
  def self.start_session(adapter = Configuration.adapter)
    adapter.new(Calculator.new)
  end

  def self.configure(&block)
    block.call(Polski::Configuration)
  end
end
