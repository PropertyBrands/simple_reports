require 'csv'

module SimpleReports
  module Render
    module Csv
      class Table
        attr_reader :table

        def initialize(table)
          @table = table
        end

        def render
          csv = CSV.generate do |csv|
            data.each do |row|
              csv << row
            end
          end

          if @table.title.present?
            csv = "Table Title: #{@table.title}\n" + csv
          end

          csv
        end

        private

        def data
          [table.header] + table_rows
        end

        def table_rows
          table.rows.map { |row| row.cells.map { |cell| cell.content } }
        end
      end
    end
  end
end
