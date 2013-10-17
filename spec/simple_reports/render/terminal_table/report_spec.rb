require 'spec_helper'

describe SimpleReports::Render::TerminalTable::Report do

  let(:report) { basic_report }
  subject { described_class.new(report) }

  describe "#render" do
    before do
      subject.stub(report_title: 'title', render_tables: 'tables')
    end
    its(:render) { should eq "title\ntables" }
  end

  describe "#report_title" do
    its(:report_title) { should eq 'REPORT TITLE' }
  end

  describe "#render_tables" do
    let(:report) {
      report = basic_report
      report.tables.push('another table')
      report
    }

    before do
      SimpleReports::Render::TerminalTable::Table.any_instance.
        stub(render: 'table')
    end

    its(:render_tables) { should eq "table\ntable" }
  end

end
