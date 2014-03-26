require 'spec_helper'

describe SimpleReports::Table do
  let(:options) { { } }
  subject { described_class.new(options) }

  it_behaves_like "option defaults", [:title, :header]
  it_behaves_like "optional option defaults", [:format]

  describe "#rows" do
    context "when none provided" do
      before { subject.should_receive(:build_rows).once }
      it "should call build_rows to build the rows" do
        subject.rows
      end
    end

    context "when rows provided" do
      let(:options) { { rows: ['row1'] } }
      it "returns the rows" do
        expect(subject.rows).to eq ['row1']
      end
    end
  end

  describe "#build_rows" do
    it "raises an exception" do
      expect { subject.build_rows }.
        to raise_exception SimpleReports::Table::RowsNotProvidedError
    end
  end

  describe "#format!" do
    before do
      formatter_mock = double()
      formatter_mock.should_receive(:format_table!).and_return(true)
      SimpleReports::TableFormatter.should_receive(:new).with(subject).
        and_return(formatter_mock)
    end
    it "formats the table's cells with TableFormatter" do
      expect(subject.format!).to be_true
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
        with(SimpleReports::Render::TerminalTable::Table).
        and_return('result')
    end

    it "calls #render_with using TerminalTable as the default" do
      expect(subject.to_s).to eq 'result'
    end
  end
end

describe SimpleReports::Table, '#to_a' do
  it 'builds a two-dimensional array containing the cell contents' do
    subject = basic_table

    result = subject.to_a

    expect(result).to eq [['Col1', 'Col2'], ['A1', 'A2'], ['B1', 'B2']]
  end
end
