require 'spec_helper'

describe SimpleReports::Report do
  let(:options) { { } }
  subject { described_class.new(options) }

  it_behaves_like "option defaults", [:title, :tables]

  describe "#format!" do
    let(:table) { double('Table') }
    before do
      subject.stub(tables: [table])
      formatter_mock = double()
      formatter_mock.should_receive(:format_table!).and_return(true)
      SimpleReports::TableFormatter.should_receive(:new).with(table).
        and_return(formatter_mock)
    end
    it "formats the tables' cells with TableFormatter" do
      expect(subject.format!).to eq [true]
    end
  end

  describe "#render_with" do
    class SampleRender; end
    let(:render_class) { SampleRender }
    let(:render_mock) {
      mock = double()
      mock.should_receive(:render).and_return('render result')
      mock
    }

    before do
      subject.should_receive(:format!).once
      render_class.should_receive(:new).with(subject).
        and_return(render_mock)
    end

    it "uses the render_class to render the table" do
      expect(subject.render_with(render_class)).to eq 'render result'
    end
  end

  describe "#to_s" do
    before do
      subject.should_receive(:render_with).
        with(SimpleReports::Render::TerminalTable::Report).
        and_return('result')
    end

    it "calls #render_with using TerminalTable as the default" do
      expect(subject.to_s).to eq 'result'
    end
  end
end
