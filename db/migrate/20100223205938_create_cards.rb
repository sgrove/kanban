class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.integer :project_id
      t.integer :stage_id
      t.string :name
      t.string :summary
      t.timestamps
    end
  end

  def self.down
    drop_table :cards
  end
end
