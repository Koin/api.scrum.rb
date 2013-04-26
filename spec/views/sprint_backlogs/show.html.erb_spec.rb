require 'spec_helper'

describe "sprint_backlogs/show" do
  before(:each) do
    @sprint_backlog = assign(:sprint_backlog, stub_model(SprintBacklog))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
