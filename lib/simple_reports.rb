require 'active_support/core_ext/date'
require 'active_support/core_ext/date_time'
require 'active_support/core_ext/module'
require 'active_support/number_helper'

module SimpleReports
  class Format
    attr_reader :klass, :options
    def initialize(klass, options = {})
      @klass, @options = klass, options
    end
    def to_formatter
      @formatter ||= klass.new(options)
    end
  end

  mattr_accessor :formats
end

require 'simple_reports/report'
require 'simple_reports/table'
require 'simple_reports/row'
require 'simple_reports/cell'
require 'simple_reports/table_formatter'

require 'simple_reports/formatters'
require 'simple_reports/formatters/base_formatter'
require 'simple_reports/formatters/currency_formatter'
require 'simple_reports/formatters/date_time_formatter'
require 'simple_reports/formatters/noop_formatter'
require 'simple_reports/formatters/string_formatter'

require 'simple_reports/render'

require 'simple_reports/render/terminal_table'
require 'simple_reports/render/terminal_table/report'
require 'simple_reports/render/terminal_table/table'

require 'simple_reports/render/html'
require 'simple_reports/render/html/report'
require 'simple_reports/render/html/table'
require 'simple_reports/render/html/row'
require 'simple_reports/render/html/cell'

SimpleReports.formats = {
  currency: SimpleReports::Format.new(SimpleReports::Formatters::CurrencyFormatter),
  date_time: SimpleReports::Format.new(SimpleReports::Formatters::DateTimeFormatter),
  noop: SimpleReports::Format.new(SimpleReports::Formatters::NoopFormatter),
  string: SimpleReports::Format.new(SimpleReports::Formatters::StringFormatter)
}
