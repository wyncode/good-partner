class ChangeDescriptionToTextInJobs < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :description, :text
  end
end
