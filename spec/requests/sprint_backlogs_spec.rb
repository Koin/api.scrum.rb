require 'spec_helper'

describe "SprintBacklogs" do
  describe "GET /sprint_backlogs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sprint_backlogs_path
      response.status.should be(200)
    end
  end
end
