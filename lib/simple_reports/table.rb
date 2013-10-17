module SimpleReports
  class Table

    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    def title
      options.fetch(:title)
    end

    def header
      options.fetch(:header)
    end

    # @returns [Array<String, SimpleReports::Format>] formats for each column in
    #   table
    def format
      options[:format] || [] # TODO: test nil returns []
    end

    def rows
      options.fetch(:rows)
    end

    # Formats the table's cell contents.
    def format!
      SimpleReports::TableFormatter.new(self).format_table!
    end

    # Renders the table with the provided render class.
    #
    # The render class should accept a table as the sole argument to +.new+ and
    # should respond to the +render+ method.
    #
    # Before rendering the table, the cell content is formatted.
    def render_with(render_class)
      format!
      render_class.new(self).render
    end

    # Renders the table. An alias to +render_with+ that defaults to using the
    # TerminalTable render class.
    def to_s(render_class = SimpleReports::Render::TerminalTable::Table)
      render_with(render_class)
    end

  end
end
