# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "simple_reports"
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Winograd"]
  s.date = "2014-10-01"
  s.description = "Easily build reports"
  s.email = "ryan@thewinograds.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "Guardfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/simple_reports.rb",
    "lib/simple_reports/cell.rb",
    "lib/simple_reports/format.rb",
    "lib/simple_reports/formatters.rb",
    "lib/simple_reports/formatters/base_formatter.rb",
    "lib/simple_reports/formatters/currency_formatter.rb",
    "lib/simple_reports/formatters/date_time_formatter.rb",
    "lib/simple_reports/formatters/noop_formatter.rb",
    "lib/simple_reports/formatters/string_formatter.rb",
    "lib/simple_reports/render.rb",
    "lib/simple_reports/render/csv.rb",
    "lib/simple_reports/render/csv/report.rb",
    "lib/simple_reports/render/csv/table.rb",
    "lib/simple_reports/render/html.rb",
    "lib/simple_reports/render/html/cell.rb",
    "lib/simple_reports/render/html/report.rb",
    "lib/simple_reports/render/html/row.rb",
    "lib/simple_reports/render/html/table.rb",
    "lib/simple_reports/render/terminal_table.rb",
    "lib/simple_reports/render/terminal_table/report.rb",
    "lib/simple_reports/render/terminal_table/table.rb",
    "lib/simple_reports/report.rb",
    "lib/simple_reports/row.rb",
    "lib/simple_reports/table.rb",
    "lib/simple_reports/table_formatter.rb",
    "simple_reports.gemspec",
    "spec/integration/csv_integration_spec.rb",
    "spec/integration/terminal_table_integration_spec.rb",
    "spec/simple_reports/cell_spec.rb",
    "spec/simple_reports/format_spec.rb",
    "spec/simple_reports/formatters/currency_formatter_spec.rb",
    "spec/simple_reports/formatters/date_time_formatter_spec.rb",
    "spec/simple_reports/formatters/noop_formatter_spec.rb",
    "spec/simple_reports/formatters/string_formatter_spec.rb",
    "spec/simple_reports/render/html/cell_spec.rb",
    "spec/simple_reports/render/html/report_spec.rb",
    "spec/simple_reports/render/html/row_spec.rb",
    "spec/simple_reports/render/html/table_spec.rb",
    "spec/simple_reports/render/terminal_table/report_spec.rb",
    "spec/simple_reports/render/terminal_table/table_spec.rb",
    "spec/simple_reports/report_spec.rb",
    "spec/simple_reports/row_spec.rb",
    "spec/simple_reports/table_formatter_spec.rb",
    "spec/simple_reports/table_spec.rb",
    "spec/simple_reports_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/formatter_shared.rb",
    "spec/support/option_defaults_shared.rb"
  ]
  s.homepage = "http://github.com/rylwin/simple_reports"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Easily build reports"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<terminal-table>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<yard>, ["~> 0.7"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.7"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<terminal-table>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<yard>, ["~> 0.7"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<terminal-table>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<yard>, ["~> 0.7"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
  end
end

