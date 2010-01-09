require 'rake'
require 'rake/clean'
require 'rake/testtask'

desc "Install the hashslice library (non-gem)"
task :install do
   cp 'lib/hashslice.rb', Config::CONFIG['sitelibdir'], :verbose => true
end

desc 'Build the hashslice gem'
task :gem do
   spec = eval(IO.read('hashslice.gemspec'))
   Gem::Builder.new(spec).buildend

desc "Install the hashslice library as a gem"
task :install_gem => [:gem] do
   file = Dir["*.gem"].first
   sh "gem install #{file}"end

Rake::TestTask.new do |t|
   t.warning = true
   t.verbose = true
end
