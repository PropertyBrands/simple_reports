module SimpleReports::Render::HTML
  class Table

    attr_reader :table

    def initialize(table)
      @table = table
    end

    def render
      [table_title, '<table>', table_header, table_body, '</table>'].join
    end

    def table_title
      "<h3>#{table.title}</h3>"
    end

    def before_table_header
      "<thead>"
    end

    def table_header
      header = table.header.each_with_index.map do |h, index|
        header_cell = build_header_cell(h, index)
        SimpleReports::Render::HTML::Cell.new(header_cell, 'th').render
      end.join

      before_table_header << header << after_table_header
    end

    def after_table_header
      "</thead>"
    end

    def table_body
      tables = table.rows.
        map { |r| SimpleReports::Render::HTML::Row.new(r).render }.join

      "<tbody>#{tables}</tbody>"
    end

    private

    def build_header_cell(header_text, index)
      SimpleReports::Cell.new(
        content: header_text,
        format: @table.format[index],
      )
    end
  end
end
