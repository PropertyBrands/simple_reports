module SimpleReports::Formatters
  class StringFormatter < BaseFormatter
    def format(content)
      content.to_s
    end
  end
end
