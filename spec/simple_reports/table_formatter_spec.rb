require 'spec_helper'

describe SimpleReports::TableFormatter do
  subject { described_class.new(nil) }

  # TODO: this is an integration style test
  describe "#format_table!" do
    let(:row) { SimpleReports::Row.new(cells: ['1.23', Date.new(2000, 1, 1)]) }

    let(:table) {
      SimpleReports::Table.new(rows: [row], format: [:currency, :date_time])
    }

    subject { described_class.new(table) }

    before do
      subject.format_table!
    end

    it "updates the cell's format option" do
      expect(table.rows[0].cells[0].format).to eq :currency
    end

    it "formats the cells in the table" do
      expect(table.rows[0].cells[0].content).to eq '$1.23'
      expect(table.rows[0].cells[1].content).to eq '2000-01-01'
    end
  end

  describe "#set_cell_format_option!" do
    let(:cell) { SimpleReports::Cell.new }
    let(:index) { 0 }

    before do
      subject.stub(:format_name).with(cell, index).and_return(:format_name)
      subject.set_cell_format_option!(cell, index)
    end

    it "sets the format name on the cell" do
      expect(cell.format).to eq :format_name
    end
  end

  describe "#format_name" do
    let(:cell) { SimpleReports::Cell.new(format: cell_format) }
    let(:table) { SimpleReports::Table.new(format: table_format) }
    let(:cell_format) { nil }
    let(:table_format) { [] }
    subject { described_class.new(table).format_name(cell, 1) }

    context "when cell has a format" do
      let(:cell_format) { :cell_format }
      it { should eq :cell_format }
    end

    context "when table has a column format" do
      let(:table_format) { [:noop, :table_format] }
      it { should eq :table_format }
    end

    context "when no format set by cell or table" do
      it { should eq :noop }
    end
  end

  describe "#format_cell!" do
    let(:cell) { SimpleReports::Cell.new(content: 'hello') }
    before { subject.stub(:format_cell).with(cell).and_return('formatted') }
    it "updates the cell's content with the formatted content" do
      expect(subject.format_cell!(cell)).to eq 'formatted'
      expect(cell.content).to eq 'formatted'
    end
  end

  describe "#format_cell" do
    let(:cell) { SimpleReports::Cell.new(content: 'hello', format: format_name) }
    let(:format_name) { :format_name }
    let(:format_mock) {
      mock = double('Formatter')
      mock.should_receive(:to_formatter).and_return(formatter_mock)
      mock
    }
    let(:formatter_mock) {
      mock = double('Formatter')
      mock.should_receive(:format).with('hello').and_return('formatted')
      mock
    }

    before do
      subject.stub(:format_name).with(cell).and_return(format_name)
      SimpleReports.formats[format_name] = format_mock
    end

    it "formats the cell content using the formatter referenced by the format name" do
      expect(subject.format_cell(cell)).to eq 'formatted'
    end
  end

end
