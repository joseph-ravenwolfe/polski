module Polski
  module Adapter
    # The Console Adapter acts as a Console interface to the Polski calculator.
    # It utilizes STDIN and STDOUT to parse input and provides helpers such
    # as the ability to quit.
    #
    class ConsoleAdapter
      attr_accessor :calculator

      def initialize(calculator, production = true)
        self.calculator = calculator
        spawn_interface if production
      end

      private

      def spawn_interface
        loop do
          $stdout.write('> ')
          expression = $stdin.gets.chomp
          break if expression =~ /^(q|quit|exit)$/
          calculator.push(expression)
          $stdout.write("#{calculator.result}\n")
        end
        STDOUT.write("Bye!\n")
        Kernel.exit
      end
    end
  end
end
