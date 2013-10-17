require 'spec_helper'

describe SimpleReports::Cell do
  let(:options) { { } }
  subject { described_class.new(options) }

  it_behaves_like "option defaults", [:content]
end
