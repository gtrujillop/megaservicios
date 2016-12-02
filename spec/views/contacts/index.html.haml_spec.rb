require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
        :full_name => "Full Name",
        :email => "Email",
        :phone => "Phone",
        :address => "Address",
        :problem => "MyText"
      ),
      Contact.create!(
        :full_name => "Full Name",
        :email => "Email",
        :phone => "Phone",
        :address => "Address",
        :problem => "MyText"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
