require 'rails_helper'

RSpec.describe "activities/index", type: :view do
  before(:each) do
    assign(:activities, [
      Activity.create!(
        :user => nil,
        :content => "Content"
      ),
      Activity.create!(
        :user => nil,
        :content => "Content"
      )
    ])
  end

  it "renders a list of activities" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
