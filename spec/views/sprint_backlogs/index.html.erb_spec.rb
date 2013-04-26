require 'spec_helper'

describe "sprint_backlogs/index" do
  before(:each) do
    assign(:sprint_backlogs, [
      stub_model(SprintBacklog),
      stub_model(SprintBacklog)
    ])
  end

  it "renders a list of sprint_backlogs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
