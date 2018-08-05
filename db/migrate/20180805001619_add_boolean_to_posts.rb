class AddBooleanToPosts < ActiveRecord::Migration[5.2]
  def change
  	add_column :posts, :task_done, :boolean
  end
end
