require 'polski/version'
require 'polski/configuration'
require 'polski/adapter/string_adapter'
require 'polski/adapter/console_adapter'
require 'polski/calculator'
require 'polski/calculation'
require 'polski/token'

# Pending
module Polski
  def self.start_session(adapter = Configuration.adapter)
    adapter.new(Calculator.new)
  end

  # Used to configure long lived information needed throughout the scanning
  # process. Provides access to `host` and `port` along with other information
  # used to configure the orientation and dimensions of scanned racks.
  #
  # Example:
  #     VisionMate.configure do |config|
  #       config.host = "192.168.1.1"
  #       config.port = "8080"
  #     end
  #
  #     VisionMate::Configuration.host # => "192.168.1.1"
  #     VisionMate::Configuration.port # => "8080"
  #
  def self.configure(&block)
    block.call(Polski::Configuration)
  end
end
