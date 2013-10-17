module SimpleReports::Render::HTML
  class Row

    attr_reader :row

    def initialize(row)
      @row = row
    end

    def render
      cells = row.cells.map { |cell|
        SimpleReports::Render::HTML::Cell.new(cell).render
      }.join

      "<tr>#{cells}</tr>"
    end

  end
end
