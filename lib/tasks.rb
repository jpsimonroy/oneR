desc "run"
task :run do
  require 'oneR'
  Dir["#{Dir.pwd}/*.rb"].each {|f| require f}
  TaskRunner.new("#{Dir.pwd}/oneR.json").run
end