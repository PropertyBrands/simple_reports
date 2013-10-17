require 'spec_helper'

describe SimpleReports::Format do

  class SampleFormatter; end

  let(:format_options) { { } }
  let(:formatter_options) { { } }
  subject { described_class.new(SampleFormatter, format_options, formatter_options) }

  describe "#to_formatter" do
    let(:formatter_options) { { opt: 1 } }
    before do
      SampleFormatter.should_receive(:new).once.with(formatter_options).
        and_return('Formatter')
    end
    it "instantiates the formatter with formatter_options" do
      expect(subject.to_formatter).to eq 'Formatter'
    end

    it "memoizes the result" do
      expect(subject.to_formatter).to eq 'Formatter'
      expect(subject.to_formatter).to eq 'Formatter'
    end
  end

  describe "#alignment" do
    context "without alignment specified" do
      its(:alignment) { should eq :left }
    end

    context "with alignment specified as :right" do
      let(:format_options) { { alignment: :right } }
      its(:alignment) { should eq :right }
    end
  end

end
