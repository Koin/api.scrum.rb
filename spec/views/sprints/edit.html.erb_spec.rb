require 'spec_helper'

describe "sprints/edit" do
  before(:each) do
    @sprint = assign(:sprint, stub_model(Sprint,
      :state => 1
    ))
  end

  it "renders the edit sprint form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sprint_path(@sprint), "post" do
      assert_select "input#sprint_state[name=?]", "sprint[state]"
    end
  end
end
