# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{nullify}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steve Richert"]
  s.date = %q{2009-06-16}
  s.description = %q{Nuke blank values in ActiveRecord models}
  s.email = %q{steve@laserlemon.com}
  s.extra_rdoc_files = ["lib/nullify.rb", "README.rdoc", "tasks/nullify_tasks.rake"]
  s.files = ["init.rb", "lib/nullify.rb", "Manifest", "MIT-LICENSE", "nullify.gemspec", "Rakefile", "README.rdoc", "tasks/nullify_tasks.rake", "test/nullify_test.rb", "test/test_helper.rb", "VERSION.yml"]
  s.homepage = %q{http://github.com/laserlemon/nullify}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Nullify", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{nullify}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Nuke blank values in ActiveRecord models}
  s.test_files = ["test/nullify_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
