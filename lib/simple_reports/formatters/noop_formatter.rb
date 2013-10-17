module SimpleReports::Formatters
  class NoopFormatter < BaseFormatter
    def format(content)
      content
    end
  end
end
