class CreateStages < ActiveRecord::Migration
  def self.up
    create_table :stages do |t|
      t.string :name
      t.string :permalink
      t.string :summary
      t.integer :project_id
      t.integer :limit
      t.timestamps
    end
  end

  def self.down
    drop_table :stages
  end
end
