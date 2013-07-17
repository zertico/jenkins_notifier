require 'spec_helper'

describe Project::Remote do
  let(:project) { Project.new }
  let(:remote) { Project::Remote.new(project) }

  describe '#uri' do
    before :each do
      project.bitbucket = 'zertico/jenkins_notifier'
    end

    it 'should return the complete uri' do
      remote.uri.should == 'git@bitbucket.org:zertico/jenkins_notifier.git'
    end
  end
end