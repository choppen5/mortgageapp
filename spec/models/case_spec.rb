require 'spec_helper'

describe Case do
  let(:user) { FactoryGirl.create(:user) }
  let(:company) { FactoryGirl.create(:company) }


  context "Creating a new case associated to the user" do
    let (:user_case) do
      user.cases.build(
        :description => "Lorem ipsum",
        :status => "open",
        :company_id => company.id
      )
    end

    subject { user_case }

    it { should respond_to(:description) }
    it { should respond_to(:status) }
    it { should respond_to(:user_id) }
    it { should respond_to(:user) }
    it { should respond_to(:company_id) }
    it { should respond_to(:company) }

    describe "association to user are properly saved" do
      subject { user_case.user_id }

      it{ should == user.id }
    end
    describe "association to company are properly saved" do
      subject { user_case.company_id }

      it{ should == company.id }
    end
  end


end
