module SimpleReports
  module Render
    module Csv
      class Report
        attr_reader :report

        def initialize(report)
          @report = report
        end

        def render
          [report_title, render_tables].
            join SimpleReports::Render::Csv::LINE_SEPARATOR
        end

        # @api private
        def report_title
          "Report Title: #{report.title.upcase}"
        end

        # @api private
        def render_tables
          report.tables.
            map { |t| SimpleReports::Render::Csv::Table.new(t).render }.
            join SimpleReports::Render::Csv::LINE_SEPARATOR
        end
      end
    end
  end
end
