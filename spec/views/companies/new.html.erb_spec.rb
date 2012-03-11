require 'spec_helper'

describe "companies/new" do
  before(:each) do
    assign(:company, stub_model(Company,
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :address => "MyString",
      :fax => "MyString",
      :programs => "MyString",
      :handle => "MyString"
    ).as_new_record)
  end

  it "renders new company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => companies_path, :method => "post" do
      assert_select "input#company_name", :name => "company[name]"
      assert_select "input#company_email", :name => "company[email]"
      assert_select "input#company_phone", :name => "company[phone]"
      assert_select "input#company_address", :name => "company[address]"
      assert_select "input#company_fax", :name => "company[fax]"
      assert_select "input#company_programs", :name => "company[programs]"
      assert_select "input#company_handle", :name => "company[handle]"
    end
  end
end
