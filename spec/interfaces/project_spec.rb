require 'spec_helper'

describe Project do
  let(:project) { Project.new }

  it { should validate_presence_of(:bitbucket) }
  it { should validate_presence_of(:endpoint) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:token) }

  describe '#working_dir' do
    it 'should return a WorkingDir instance' do
      project.working_dir.should be_an_instance_of(Project::WorkingDir)
    end
  end

  describe '#remote' do
    it 'should return a Remote instance' do
      project.remote.should be_an_instance_of(Project::Remote)
    end
  end

  describe '#build' do
    it 'should return a Build instance' do
      project.build.should be_an_instance_of(Project::Build)
    end
  end
end