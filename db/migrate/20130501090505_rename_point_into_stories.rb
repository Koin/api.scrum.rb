class RenamePointIntoStories < ActiveRecord::Migration
  def change
    change_table :stories do |t|
      t.rename :point, :technical_point
    end
  end
end
