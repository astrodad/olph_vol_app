require 'spec_helper'

describe Worker do
  
	let(:account) {FactoryGirl.create(:account)}
	before {@worker = account.workers.build(name: "Bob the tester")}

	subject {@worker}

	it {should respond_to(:name)}
	it {should respond_to(:email)}

	#it {should respond_to(:completed_events)}
	it {should be_valid}

	describe "when name is not present" do
    before { @worker.name = " " }
    it { should_not be_valid }
  end

  describe "worker name is too long" do
  	before { @worker.name = "a" * 101}
  	it { should_not be_valid}
  end




end
