module Ean
  class APIError < StandardError

    attr_reader :code
    attr_reader :detail
    attr_reader :type
    attr_reader :response

    def initialize(error, response)
      @code = error.code
      @details = error.errorDetail
      @type = error.errorType
      @response = response
    end

    def message
      "#{@type}: #{@detail} (#{@code})"
    end
  end
end
