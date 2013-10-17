require 'spec_helper'

describe SimpleReports::Render::HTML::Report do

  let(:report) { basic_report }
  subject { described_class.new(report) }

  describe "#render" do
    before do
      subject.stub(report_title: 'title', render_tables: 'tables')
    end
    its(:render) { should eq "titletables" }
  end

  describe "#report_title" do
    its(:report_title) { should eq "<h3>Report Title</h3>" }
  end

  describe "#tables" do
    pending
  end

end
