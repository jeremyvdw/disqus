require "rake"
require "rake/testtask"
require "rake/gempackagetask"
require "rake/rdoctask"
require "rake/clean"
require 'disqus/version'

CLEAN << "pkg" << "doc" << "coverage"

Rake::GemPackageTask.new(eval(File.read("disqus.gemspec"))) { |pkg| }

task :default => :test
Rake::TestTask.new do |t|
   t.libs << ['lib', 'test']
   t.pattern = 'test/**/*_test.rb'
   t.verbose = true
 end

Rake::RDocTask.new do |r|
  r.rdoc_dir = "doc"
  r.rdoc_files.include "lib/**/*.rb"
end

begin
  require "rcov/rcovtask"
  Rcov::RcovTask.new do |r|
    r.test_files = FileList["test/**/*_test.rb"]
    r.verbose = true
    r.rcov_opts << "--exclude gems/*"
  end
rescue LoadError
end