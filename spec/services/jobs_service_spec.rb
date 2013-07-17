require 'spec_helper'
require 'sidekiq/testing'

describe JobsService do
  let(:project) { Project.new }
  let(:controller) { Object.new }

  before :each do
    controller.extend JobsService
    ProjectWorker.jobs.clear
  end

  context '#generate' do
    before :each do
      Project.stub(:find => project)
      @response = controller.generate(1)
    end

    it 'should queue a job' do
      ProjectWorker.jobs.size.should == 1
    end

    it 'should return a hash' do
      @response.should == { :location => "/projects", :project => project }
    end
  end
end