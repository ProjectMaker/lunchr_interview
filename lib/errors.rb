module Errors
  class UnpermittedParameterValue < StandardError
    def initialize(parameter:, value:)
      @parameter = parameter
      @value = value
    end

    attr_reader :parameter

    def message
      "'Value #{ @value }' is not supported value for the parameter."
    end
  end
end
