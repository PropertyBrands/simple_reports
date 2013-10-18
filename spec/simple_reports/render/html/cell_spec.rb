require 'spec_helper'

describe SimpleReports::Render::HTML::Cell do
  let(:cell) { SimpleReports::Cell.new(content: 'hello') }
  subject { described_class.new(cell) }

  its(:render) { should eq "<td>hello</td>" }

  context "a cell with alignment" do
    let(:cell) { SimpleReports::Cell.new(content: 'hello', format: :currency) }

    its(:render) { should eq "<td class=\"align-right\">hello</td>" }
  end
end
