module SimpleReports
  class Format

    attr_reader :klass, :format_options, :formatter_options

    def initialize(klass, format_options = {}, formatter_options = {})
      @klass = klass
      @format_options = format_options
      @formatter_options = formatter_options
    end

    def to_formatter
      @formatter ||= klass.new(formatter_options)
    end

    def alignment
      format_options[:alignment] || :left
    end

  end
end
