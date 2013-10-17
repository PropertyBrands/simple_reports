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
end
