class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :label
      t.text :description
      t.float :point
      t.integer :state
      t.references :sprint_backlog, index: true

      t.timestamps
    end
  end
end
