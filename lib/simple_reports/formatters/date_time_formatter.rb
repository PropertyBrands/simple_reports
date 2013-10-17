module SimpleReports::Formatters
  class DateTimeFormatter < BaseFormatter
    def format(content)
      if options[:format]
        content.to_s(options[:format])
      else
        content.to_s
      end
    end
  end
end
