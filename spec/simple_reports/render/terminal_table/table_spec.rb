require 'spec_helper'

describe SimpleReports::Render::TerminalTable::Table do
  let(:table) { basic_table }
  subject { described_class.new(table) }

  describe "#render" do
    let(:expected) {
      "+------+------+\n| Table Title |\n+------+------+\n| Col1 | Col2 " <<
        "|\n+------+------+\n| A1   | A2   |\n| B1   | B2   |\n+------+------+"
    }

    its(:render) { should eq expected }
  end

  describe "#cell_to_terminal_table_cell" do
    subject { super().cell_to_terminal_table_cell(cell) }

    context "a cell with content and no options" do
      let(:cell) { SimpleReports::Cell.new(content: 123) }
      it { should eq 123 }
    end

    context "a cell with content and alignment option" do
      let(:cell) { SimpleReports::Cell.new(content: 123, format: :currency) }
      it { should eq({ value: 123, alignment: :right }) }
    end
  end
end
