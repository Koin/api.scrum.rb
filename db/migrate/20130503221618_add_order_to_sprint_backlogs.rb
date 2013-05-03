class AddOrderToSprintBacklogs < ActiveRecord::Migration
  def change
    add_column :sprint_backlogs, :order, :integer
  end
end
