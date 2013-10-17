module SimpleReports::Render::TerminalTable
  class Report

    attr_reader :report

    def initialize(report)
      @report = report
    end

    def render
      [report_title, render_tables].
        join SimpleReports::Render::TerminalTable::LINE_SEPARATOR
    end

    # @api private
    def report_title
      report.title.upcase
    end

    # @api private
    def render_tables
      report.tables.
        map { |t| SimpleReports::Render::TerminalTable::Table.new(t).render }.
        join SimpleReports::Render::TerminalTable::LINE_SEPARATOR
    end

  end
end
