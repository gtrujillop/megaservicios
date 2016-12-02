require 'rails_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, Contact.new(
      :full_name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :address => "MyString",
      :problem => "MyText"
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input#contact_full_name[name=?]", "contact[full_name]"

      assert_select "input#contact_email[name=?]", "contact[email]"

      assert_select "input#contact_phone[name=?]", "contact[phone]"

      assert_select "input#contact_address[name=?]", "contact[address]"

      assert_select "textarea#contact_problem[name=?]", "contact[problem]"
    end
  end
end
