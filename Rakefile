require 'rake/testtask'

Rake::TestTask.new('test') do |t|
  t.pattern = 'test/**/*_test.rb'
end

task :console do
  require 'irb'
  require 'irb/completion' # no cargaba 
  # arreglado con sudo gem install rb-readline
  require 'dni_nie'
  ARGV.clear
  IRB.start
end

desc "Ejecuta tests | Run tests"
task default: 'test'
