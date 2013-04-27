require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :label => "MyString",
      :description => "MyText",
      :point => 1.5,
      :state => 1
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", task_path(@task), "post" do
      assert_select "input#task_label[name=?]", "task[label]"
      assert_select "textarea#task_description[name=?]", "task[description]"
      assert_select "input#task_point[name=?]", "task[point]"
      assert_select "input#task_state[name=?]", "task[state]"
    end
  end
end
