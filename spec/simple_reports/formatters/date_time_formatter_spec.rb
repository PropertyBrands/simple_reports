require 'spec_helper'

describe SimpleReports::Formatters::DateTimeFormatter do
  it_behaves_like 'formatter', Date.new(2000, 1, 31), '2000-01-31'
  it_behaves_like 'formatter', DateTime.new(2000, 1, 31), '2000-01-31T00:00:00+00:00'

  context "when given the format option :long_ordinal" do
    subject { described_class.new({ format: :long_ordinal }) }
    it_behaves_like 'formatter', Date.new(2000, 1, 31), 'January 31st, 2000'
  end
end
