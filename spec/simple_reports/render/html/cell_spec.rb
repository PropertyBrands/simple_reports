require 'spec_helper'

describe SimpleReports::Render::HTML::Cell do
  let(:cell) { SimpleReports::Cell.new(content: 'hello') }
  subject { described_class.new(cell) }

  its(:render) { should eq "<td>hello</td>" }
end
