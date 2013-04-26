require 'spec_helper'

describe "sprint_backlogs/edit" do
  before(:each) do
    @sprint_backlog = assign(:sprint_backlog, stub_model(SprintBacklog))
  end

  it "renders the edit sprint_backlog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sprint_backlog_path(@sprint_backlog), "post" do
    end
  end
end
