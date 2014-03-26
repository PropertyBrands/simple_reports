module SimpleReports
  class Table

    class RowsNotProvidedError < Exception; end

    attr_reader :options

    def initialize(options = {})
      @options = options
      @rows = options[:rows] || []
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

    # The rows for this table.
    #
    # If @rows is empty, the we call +build_rows+ to add items to the @rows
    # array. This method must be defined by a subclass, otherwise an error is
    # thrown.
    #
    # If you want to be able to pass rows as an option upon initialization of
    # the table, but don't want an error to be thrown because the array is
    # empty, simply override the +rows+ method to just return @rows.
    def rows
      if @rows.empty?
        build_rows
      end
      @rows
    end

    def build_rows
      raise RowsNotProvidedError.
        new('Implement build_rows or pass rows to the constructor')
    end

    def add_row(cells, options = {})
      @rows ||= []
      @rows << SimpleReports::Row.new(options.merge(cells: cells))
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

    def to_a
      [header] + @rows.map { |row| row.to_a }
    end
  end
end
