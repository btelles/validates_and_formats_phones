require 'rubygems'
require 'rake'
require 'rake/gempackagetask'
require 'spec/rake/spectask'

desc 'Default: run specs.'
task :default => :spec

desc 'Run the specs'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_opts = ['--colour --format progress --loadby mtime --reverse']
  t.spec_files = FileList['spec/**/*_spec.rb']
end

PKG_FILES = FileList[
  '[a-zA-Z]*',
  'generators/**/*',
  'lib/**/*',
  'rails/**/*',
  'tasks/**/*',
  'test/**/*'
]

spec = Gem::Specification.new do |s|
  s.name = "validates_and_formats_phones"
  s.version = "0.0.1"

  s.author = "Bernie Telles"
  s.email = "btelles@gmail.com"
  s.homepage = "http://frontended.com/"
  s.platform = Gem::Platform::RUBY
  s.summary = "Allows you to easily format and validate formats in any format you desire (sensible defaults provided)."
  s.files = PKG_FILES.to_a
  s.require_path = "lib"

  s.has_rdoc = false
  s.extra_rdoc_files = ["README"]
end

desc 'Turn this plugin into a gem.'
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

