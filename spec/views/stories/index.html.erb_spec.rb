require 'spec_helper'

describe "stories/index" do
  before(:each) do
    assign(:stories, [
      stub_model(Story,
        :label => "Label",
        :description => "MyText",
        :point => 1.5,
        :functional_point => 1.5,
        :state => 1,
        :product => nil
      ),
      stub_model(Story,
        :label => "Label",
        :description => "MyText",
        :point => 1.5,
        :functional_point => 1.5,
        :state => 1,
        :product => nil
      )
    ])
  end

  it "renders a list of stories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
