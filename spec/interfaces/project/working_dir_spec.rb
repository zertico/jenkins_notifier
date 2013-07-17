require 'spec_helper'

describe Project::WorkingDir do
  let(:project) { Project.new }
  let(:working_dir) { Project::WorkingDir.new(project) }

  describe '#path' do
    before :each do
      project.bitbucket = 'zertico/jenkins_notifier'
    end

    it 'should return the complete path' do
      working_dir.path.should == "#{Rails.root}/vendor/projects/zertico/jenkins_notifier"
    end
  end
end