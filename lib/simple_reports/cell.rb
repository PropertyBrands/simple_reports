module SimpleReports
  class Cell

    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    def content
      options.fetch(:content)
    end

    # TODO: test
    def format
      options[:format]
    end

  end
end
