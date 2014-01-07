require "oneR/version"

class OneRTask
  attr_reader :sys_path, :prop_path, :execution_context

  def initialize(options={})
    raise('properties.path is not specified') unless options['properties.path']
    raise('system.path is not specified') unless options['system.path']
    self.sys_path=options['system.path']
    self.prop_path=options['properties.path']
    self.execution_context=File.open("#{self.sys_path}/migrations.oneR", 'rb') { |file| Marshal.load(file) } if File.exists?("#{self.sys_path}/migrations.oneR")
  end

  def prepare
    gem_list=gems
    gem_list.each { |gem| system("gem install #{gem}", :out => STDOUT, :err => STDERR) }
  end

  def gems
    #noop
  end

  def bypass
    return false unless execution_context
    if execution_context[name]
      puts "Task:#{name} already run on: #{execution_context[name][run_date]}"
      return true
    end
    false
  end

  def do_task
    return if bypass
    prepare; task; done
  end

  def task
    #noop
  end

  def name
    return self.class.to_s
  end

  def done
    execution_context ||= {}
    execution_context[name]={run_date: Time.now}
    File.open("#{self.sys_path}/migrations.oneR", 'wb') { |file| Marshal.dump(execution_context, file) }
  end
end
