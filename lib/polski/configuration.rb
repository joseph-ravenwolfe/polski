module Polski
  # The Configuration provides access to long lived information needed
  # throughout the process.
  #
  module Configuration
    class << self
      attr_accessor :adapter

      # Retrieves the configured adapter or uses the StringAdapter by default.
      def adapter
        @adapter || Polski::Adapter::StringAdapter
      end
    end
  end
end
