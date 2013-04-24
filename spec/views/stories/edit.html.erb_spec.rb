require 'spec_helper'

describe "stories/edit" do
  before(:each) do
    @story = assign(:story, stub_model(Story,
      :label => "MyString",
      :description => "MyText",
      :point => 1.5,
      :functional_point => 1.5,
      :state => 1,
      :product => nil
    ))
  end

  it "renders the edit story form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", story_path(@story), "post" do
      assert_select "input#story_label[name=?]", "story[label]"
      assert_select "textarea#story_description[name=?]", "story[description]"
      assert_select "input#story_point[name=?]", "story[point]"
      assert_select "input#story_functional_point[name=?]", "story[functional_point]"
      assert_select "input#story_state[name=?]", "story[state]"
      assert_select "input#story_product[name=?]", "story[product]"
    end
  end
end
