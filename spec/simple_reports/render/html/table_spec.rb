require 'spec_helper'

describe SimpleReports::Render::HTML::Table do

  let(:table) { basic_table }
  subject { described_class.new(table) }

  describe "#render" do
    before do
      subject.stub(
        table_title: 'title', table_header: 'header', table_body: 'body'
      )
    end
    its(:render) { should eq "title<table>headerbody</table>" }
  end

  describe "#table_title" do
    its(:table_title) { should eq 'Table Title' }
  end

  its(:before_table_header) { should eq "<thead>" }
  its(:table_header) { should eq "<thead><th>Col1</th><th>Col2</th></thead>" }
  its(:after_table_header) { should eq "</thead>" }

  describe "#table_body" do
    before do
      SimpleReports::Render::HTML::Row.stub(:new).with(table.rows[0]).
        and_return(double(render: 'row0'))
      SimpleReports::Render::HTML::Row.stub(:new).with(table.rows[1]).
        and_return(double(render: 'row1'))
    end
    its(:table_body) { should eq "<tbody>row0row1</tbody>" }
  end

end

describe SimpleReports::Render::HTML::Table, '#table_header' do
  it "wraps the header columns in th's and applies formats" do
    table = SimpleReports::Table.new(
      header: ['Noop', '$'],
      format: [:noop, :currency],
    )
    subject = SimpleReports::Render::HTML::Table.new(table)

    result = subject.table_header

    expect(
      result
    ).to eq '<thead><th class="align-left">Noop</th><th class="align-right">$</th></thead>'
  end
end
