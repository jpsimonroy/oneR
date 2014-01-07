class OneRTask
  attr_accessor :properties

  def initialize(options={})
    raise('properties.path is not specified') unless options['properties.path']
    @properties = {}
    File.open(options['properties.path'], 'r').each_line do |line|
       unless line.start_with? '#'
         key, value = line.split('=')
         @properties[key] = value.strip unless value.nil?
       end
    end
  end

  def prepare
    gem_list=gems
    gem_list.each { |gem| system("gem install #{gem}", :out => STDOUT, :err => STDERR) }
  end

  def load
    #noop
  end

  def gems
    return []
  end


  def do_task
    prepare; load; task
  end

  def task
    #noop
  end
end
