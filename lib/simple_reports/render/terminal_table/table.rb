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

    # @api private
    def cell_to_terminal_table_cell(cell)
      if format = cell.format_object
        { value: cell.content, alignment: format.alignment }
      else
        cell.content
      end
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
      table.rows.map { |r| r.cells.map { |c| cell_to_terminal_table_cell(c) } }
    end

  end
end
