require 'terminal-table'

module SimpleReports::Render::TerminalTable
  class Table

    attr_reader :table

    def initialize(table)
      @table = table
    end

    def render
      terminal_table.to_s
    end

    private

    # @api private
    def terminal_table
      Terminal::Table.new(
        title: table.title, headings: table.header,
        rows: table_rows
      )
    end

    # @api private
    def table_rows
      table.rows.map { |r| r.cells.map { |c| c.content } }
    end

  end
end
