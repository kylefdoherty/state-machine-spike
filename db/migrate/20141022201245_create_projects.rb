class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.date :due_date
      t.string :project_manager
      t.string :details
      t.string :workflow_state

      t.timestamps
    end
  end
end
