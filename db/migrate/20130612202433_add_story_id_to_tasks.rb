class AddStoryIdToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :story, index: true
  end
end
