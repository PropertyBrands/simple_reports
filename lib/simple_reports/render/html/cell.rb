module SimpleReports::Render::HTML
  class Cell

    attr_reader :cell

    def initialize(cell)
      @cell = cell
    end

    def render
      "<td#{attributes}>#{cell.content}</td>"
    end

    private

    def attributes
      if format = cell.format_object
        %{ class="align-#{format.alignment}"}
      end
    end
  end
end
