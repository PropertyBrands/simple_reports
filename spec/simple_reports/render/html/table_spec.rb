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
    its(:render) { should eq "titleheaderbody" }
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
