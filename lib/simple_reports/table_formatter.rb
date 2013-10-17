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
          format_cell!(cell, i)
        end
      end

      true
    end

    # @api private
    def format_cell!(cell, column_index)
      cell.options[:content] = format_cell(cell, column_index)
    end

    # @api private
    def format_cell(cell, column_index)
      format_name = format_name(cell, column_index)
      SimpleReports.formats.fetch(format_name).to_formatter.format(cell.content)
    end

    # @api private
    def format_name(cell, column_index)
      cell.format || table.format[column_index] || :noop
    end

  end
end
