require 'json'
class TaskRunner
  attr_accessor :config

  def initialize(config_path="./oneR.json")
    @config=JSON.parse(File.new(config_path).read)
  end

  def run
    return unless @config['runList']

    @config['runList'].each do |task|
      Kernel.const_get(task).new("properties.path" => config['applicationProperties']).do_task
    end
  end
end