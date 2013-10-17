require 'spec_helper'

describe SimpleReports::Row do

  describe ".initialize" do
    let(:cell) { SimpleReports::Cell.new(content: 'in cell') }
    let(:options) { { cells: ['string', 123, cell] } }
    subject { described_class.new(options) }

    it "wraps :cells options into Cell objects" do
      expect(subject.cells[0]).to be_a SimpleReports::Cell
      expect(subject.cells[0].content).to eq 'string'

      expect(subject.cells[1]).to be_a SimpleReports::Cell
      expect(subject.cells[1].content).to eq 123

      expect(subject.cells[2]).to eq cell
    end
  end

end
