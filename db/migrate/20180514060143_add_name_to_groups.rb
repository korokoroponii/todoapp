class AddNameToGroups < ActiveRecord::Migration[5.2]
  def change
  	add_column :groups, :name, :integer
  end
end
