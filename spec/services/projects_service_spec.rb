require 'spec_helper'
require 'sidekiq/testing'

describe ProjectsService do
  let(:project) { Project.new }
  let(:controller) { Object.new }

  before :each do
    controller.extend ProjectsService
    ProjectInitializerWorker.jobs.clear
    ProjectDestroyerWorker.jobs.clear
  end

  context '#generate' do
    before :each do
      Project.stub(:create => project)
      project.stub(:persisted? => true)
      @response = controller.generate({})
    end

    it 'should queue a job' do
      ProjectInitializerWorker.jobs.size.should == 1
    end

    it 'should return a hash' do
      @response.should == { :project => project }
    end
  end

  context '#delete' do
    before :each do
      Project.stub(:find => project)
      @response = controller.delete(1)
      project.stub(:destroy => true)
    end

    it 'should queue a job' do
      ProjectDestroyerWorker.jobs.size.should == 1
    end

    it 'should return a hash' do
      @response.should == { :project => project }
    end
  end
end