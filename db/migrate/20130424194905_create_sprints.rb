class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.timestamp :start_date
      t.timestamp :end_date
      t.integer :state
      t.references :product, index: true

      t.timestamps
    end
  end
end
