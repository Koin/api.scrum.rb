require 'spec_helper'

describe "sprint_backlogs/new" do
  before(:each) do
    assign(:sprint_backlog, stub_model(SprintBacklog).as_new_record)
  end

  it "renders new sprint_backlog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sprint_backlogs_path, "post" do
    end
  end
end
