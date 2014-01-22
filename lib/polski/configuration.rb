module Polski
  module Configuration
    class << self
      attr_accessor :adapter

      def adapter
        @adapter || Polski::Adapter::StringAdapter
      end
    end
  end
end
