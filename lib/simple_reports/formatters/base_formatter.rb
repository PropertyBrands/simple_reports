module SimpleReports::Formatters
  class BaseFormatter
    attr_reader :options

    def initialize(options = {})
      @options = options
    end
  end
end
