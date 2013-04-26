require 'spec_helper'

describe "sprints/new" do
  before(:each) do
    assign(:sprint, stub_model(Sprint,
      :state => 1
    ).as_new_record)
  end

  it "renders new sprint form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sprints_path, "post" do
      assert_select "input#sprint_state[name=?]", "sprint[state]"
    end
  end
end
