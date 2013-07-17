require 'spec_helper'

describe Project::Build do
  let(:project) { Project.new }
  let(:build) { Project::Build.new(project) }

  describe '#uri' do
    before :each do
      project.endpoint = 'http://www.endpoint.com'
      project.name = 'name'
    end

    it 'should return an URI instance' do
      build.uri.should be_an_instance_of(URI::HTTP)
    end

    it 'should return the complete uri' do
      build.uri.to_s.should == 'http://www.endpoint.com/name/buildWithParameters'
    end
  end
end