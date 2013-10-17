module SimpleReports
  class Report

    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    # Returns the title from the options hash.
    #
    # Can be overridden to provide different behavior.
    #
    # @return [String] the title
    def title
      options.fetch(:title)
    end

    # Returns the tables from the options hash.
    #
    # Can be overridden to provide different behavior.
    #
    # @return [] the tables
    def tables
      options.fetch(:tables)
    end

    # Formats the tables' cell contents.
    def format!
      tables.map { |t|
        SimpleReports::TableFormatter.new(t).format_table!
      }
    end

    # Renders the report with the provided render class.
    #
    # The render class should accept a report as the sole argument to +.new+ and
    # should respond to the +render+ method.
    #
    # Before rendering the report, the tables' cell content is formatted.
    def render_with(render_class)
      format!
      render_class.new(self).render
    end

    # Renders the report. An alias to +render_with+ that defaults to using the
    # TerminalTable render class.
    def to_s(render_class = SimpleReports::Render::TerminalTable::Report)
      render_with(render_class)
    end

  end
end
