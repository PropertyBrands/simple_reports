module SimpleReports::Formatters
  class CurrencyFormatter < BaseFormatter
    def format(content)
      ActiveSupport::NumberHelper.number_to_currency(content)
    end
  end
end
