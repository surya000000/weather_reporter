module WeatherReporter
  module UserInput
    class Validator

      VALID_FLAGS = %w{-city -forecast -help}.freeze

      ERROR_MESSAGE = %q{Please enter a valid flag or Enter -help for more details}.freeze

      MESSAGE = %Q{ Please enter a Arguments eg: weather -city kathmandu \
                 weather -city kathmandu -forecast }.freeze

      private_constant :VALID_FLAGS, :ERROR_MESSAGE

      attr_reader :input_arguments

      def initialize(input_arguments)
        @input_arguments = input_arguments
      end

      def validate
        raise WeatherReporter::Error::InvalidFlag, MESSAGE if @input_arguments.empty?
        input_arguments.each do |flag_argument|
          unless @input_arguments.include?('-city') && VALID_FLAGS.include?(flag_argument[0])
            raise WeatherReporter::Error::InvalidFlag, ERROR_MESSAGE
            break;
          end
        end
      end

      def input_arguments
        @input_arguments.each_slice(2).to_a
      end
    end
  end
end
