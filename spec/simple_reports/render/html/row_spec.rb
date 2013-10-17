require 'spec_helper'

describe SimpleReports::Render::HTML::Row do
  let(:cell1) { SimpleReports::Cell.new(content: 1) }
  let(:cell2) { SimpleReports::Cell.new(content: 2) }
  let(:row) { SimpleReports::Row.new(cells: [cell1, cell2]) }
  subject { described_class.new(row) }

  before do
    SimpleReports::Render::HTML::Cell.stub(:new).with(cell1).
      and_return(double(render: 1))
    SimpleReports::Render::HTML::Cell.stub(:new).with(cell2).
      and_return(double(render: 2))
  end

  its(:render) { should eq "<tr>12</tr>" }
end
