module SimpleReports
  class Row

    attr_reader :options

    def initialize(options = {})
      @options = options
      wrap_cells_in_cells!
    end

    def cells
      options.fetch(:cells)
    end

    private

    def wrap_cells_in_cells!
      cells.each_with_index do |cell, i|
        cells[i] = SimpleReports::Cell.new(content: cell) if !cell.is_a?(SimpleReports::Cell)
      end

    end

  end
end
