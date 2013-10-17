require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'simple_reports'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|

end

# Build a basic sample report
#
# Report Title
## Table Title
# ------------
# Col1 | Col2
# ------------
# A1   |   A2
# B1   |   B2
# ------------
def basic_report
  SimpleReports::Report.new(tables: [basic_table], title: 'Report Title')
end

def basic_table
  row1 = SimpleReports::Row.new(cells: [
    SimpleReports::Cell.new(content: 'A1'),
    SimpleReports::Cell.new(content: 'A2')
  ])

  row2 = SimpleReports::Row.new(cells: [
    SimpleReports::Cell.new(content: 'B1'),
    SimpleReports::Cell.new(content: 'B2')
  ])

  SimpleReports::Table.new(
    rows: [row1, row2], header: ['Col1', 'Col2'], title: 'Table Title'
  )
end

def multi_format_report
  SimpleReports::Report.new(tables: [multi_format_table], title: 'Multiformat')
end

def multi_format_table
  t = SimpleReports::Table.new(
    header: ['Noop', 'String', 'Date', '$'],
    format: [:noop, :string, :date_time, :currency],
    title: 'Table Title'
  )
  t.add_row [1, 'hello', Date.new(2000, 1, 1), 1234.56]
  t.add_row [nil, 'world', Date.new(2050, 12, 31), 12345678.90]
  t
end
