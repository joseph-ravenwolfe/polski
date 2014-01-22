require 'polski/version'
require 'polski/configuration'
require 'polski/adapter/string_adapter'
require 'polski/adapter/console_adapter'
require 'polski/calculator'
require 'polski/calculation'
require 'polski/token'

# Polski provides a Ruby interface to configure and spawn calculator
# sessions in Reverse Polish Notation.
#
module Polski
  # Start a new session with Polski for a given Adapter. Defaults to the
  # adapter set in Configuration. See `Polski.configure` to change the adapter.
  #
  def self.start_session(adapter = Configuration.adapter)
    adapter.new(Calculator.new)
  end

  # Used to configure long lived information needed throughout the process.
  # Provides access to `adapter` used to configure the interface of the
  # calculator.
  #
  # Example:
  #     Polski.configure do |config|
  #       config.adapter = MyAdapter
  #     end
  #
  #     Polski::Configuration.adapter # => MyAdapter
  #
  def self.configure(&block)
    block.call(Polski::Configuration)
  end
end
