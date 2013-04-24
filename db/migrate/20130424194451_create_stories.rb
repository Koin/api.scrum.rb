class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :label
      t.text :description
      t.float :point
      t.float :functional_point
      t.integer :state
      t.references :product, index: true

      t.timestamps
    end
  end
end
