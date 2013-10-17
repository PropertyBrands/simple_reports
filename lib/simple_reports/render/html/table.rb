module SimpleReports::Render::HTML
  class Table

    attr_reader :table

    def initialize(table)
      @table = table
    end

    def render
      [table_title, table_header, table_body].join
    end

    def table_title
      table.title
    end

    def before_table_header
      "<thead>"
    end

    def table_header
      header = table.header.map { |h| "<th>#{h}</th>" }.join
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

  end
end
