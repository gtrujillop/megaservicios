require 'rails_helper'

RSpec.describe "contacts/edit", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :full_name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :address => "MyString",
      :problem => "MyText"
    ))
  end

  it "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do

      assert_select "input#contact_full_name[name=?]", "contact[full_name]"

      assert_select "input#contact_email[name=?]", "contact[email]"

      assert_select "input#contact_phone[name=?]", "contact[phone]"

      assert_select "input#contact_address[name=?]", "contact[address]"

      assert_select "textarea#contact_problem[name=?]", "contact[problem]"
    end
  end
end
