require 'spec_helper'

describe SimpleReports::Formatters::CurrencyFormatter do
  it_behaves_like 'formatter', 12345.123, '$12,345.12'
  it_behaves_like 'formatter', nil, nil
end
