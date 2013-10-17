require 'spec_helper'

describe SimpleReports::Render::TerminalTable::Report do

  subject { multi_format_report }

  # +MULTIFORMAT
  # ++------+--------+------------+----------------+
  # +|                 Table Title                 |
  # ++------+--------+------------+----------------+
  # +| Noop | String | Date       | $              |
  # ++------+--------+------------+----------------+
  # +| 1    | hello  | 2000-01-01 |      $1,234.56 |
  # +|      | world  | 2050-12-31 | $12,345,678.90 |
  # ++------+--------+------------+----------------+
  let(:expected) {
    "MULTIFORMAT\n+------+--------+------------+----------------+\n|                 Table Title                 |\n+------+--------+------------+----------------+\n| Noop | String | Date       | $              |\n+------+--------+------------+----------------+\n| 1    | hello  | 2000-01-01 |      $1,234.56 |\n|      | world  | 2050-12-31 | $12,345,678.90 |\n+------+--------+------------+----------------+"
  }

  it "renders correctly" do
    expect(multi_format_report.render_with(described_class)).to eq expected
  end

end
