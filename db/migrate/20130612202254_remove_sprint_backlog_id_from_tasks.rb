class RemoveSprintBacklogIdFromTasks < ActiveRecord::Migration
  def change
    remove_reference :tasks, :sprint_backlog, index: true
  end
end
