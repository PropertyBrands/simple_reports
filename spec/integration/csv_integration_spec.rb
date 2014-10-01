require 'spec_helper'

describe SimpleReports::Render::Csv::Report do
  subject { multi_format_report }

  # Report Title: MULTIFORMAT
  # Table Title: Table Title
  # Noop,String,Date,$
  # 1,hello,2000-01-01,"$1,234.56"
  # ,world,2050-12-31,"$12,345,678.90"
  let(:expected) {
    "Report Title: MULTIFORMAT\n"\
    "Table Title: Table Title\n"\
    "Noop,String,Date,$\n"\
    "1,hello,2000-01-01,\"$1,234.56\"\n"\
    ",world,2050-12-31,\"$12,345,678.90\"\n"
  }

  it "renders correctly" do
    puts multi_format_report.render_with(described_class)
    expect(multi_format_report.render_with(described_class)).to eq expected
  end
end
