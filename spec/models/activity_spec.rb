require 'spec_helper'

describe Activity do
  let(:user_case) { FactoryGirl.create(:case) }

  context "Creating a new Activity associated to a Case" do
    let (:activity) do
      user_case.activities.build(
        :content => "Lorem ipsum",
        :activity_type => "asdfasdf"
      )
    end

    subject { activity }

    it { should respond_to(:content) }
    it { should respond_to(:activity_type) }
    it { should respond_to(:case) }

    it "should store the right data" do
      subject.content.should == 'Lorem ipsum'
      subject.activity_type.should == 'asdfasdf'

    end
    describe "association to case" do
      subject { activity.case.id }

      it{ should == user_case.id }
    end
  end


end
