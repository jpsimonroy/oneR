require 'spec_helper'
describe OneRTask do
  context 'initialize' do
    it 'should load all properties' do
      task = OneRTask.new("properties.path" => "#{Dir.pwd}/spec/application.properties")
      task.properties.should == {"key1" => "value"}
    end
  end
end