module SimpleReports
  # Iterates over the cells in the table, formatting each of their contents in
  # place.
  class TableFormatter

    attr_reader :table

    def initialize(table)
      @table = table
    end

    # Formats the content of each cell.
    def format_table!
      table.rows.each do |row|
        row.cells.each_with_index do |cell, i|
          set_cell_format_option!(cell, i)
          format_cell!(cell)
        end
      end

      true
    end

    def set_cell_format_option!(cell, column_index)
      cell.options[:format] = format_name(cell, column_index)
    end

    # @api private
    def format_name(cell, column_index)
      cell.format || table.format[column_index] || :noop
    end

    # @api private
    def format_cell!(cell)
      cell.options[:content] = format_cell(cell)
    end

    # @api private
    def format_cell(cell)
      SimpleReports.formats.fetch(cell.format).to_formatter.format(cell.content)
    end

  end
end
