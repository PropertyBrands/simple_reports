module SimpleReports::Render::HTML
  class Report

    attr_reader :report

    def initialize(report)
      @report = report
    end

    def render
      [report_title, render_tables].join
    end

    # @api private
    def report_title
      "<h3>#{report.title}</h3>"
    end

    # @api private
    def render_tables
      report.tables.
        map { |t| SimpleReports::Render::HTML::Table.new(t).render }.join
    end

  end
end
