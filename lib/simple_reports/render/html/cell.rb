module SimpleReports::Render::HTML
  class Cell

    attr_reader :cell

    def initialize(cell)
      @cell = cell
    end

    def render
      "<td>#{cell.content}</td>"
    end

  end
end
