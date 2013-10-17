require 'spec_helper'

describe SimpleReports::Formatters::NoopFormatter do
  it_behaves_like 'formatter', 1, 1
end
