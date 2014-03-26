module SimpleReports::Render::HTML
  class Cell

    attr_reader :cell

    def initialize(cell, element = 'td')
      @cell = cell
      @element = element
    end

    def render
      "<#{@element}#{attributes}>#{cell.content}</#{@element}>"
    end

    private

    def attributes
      if format = cell.format_object
        %{ class="align-#{format.alignment}"}
      end
    end
  end
end
