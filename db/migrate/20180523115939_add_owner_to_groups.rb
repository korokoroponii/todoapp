class AddOwnerToGroups < ActiveRecord::Migration[5.2]
  def change
  	add_column :groups, :owner, :string
  end
end
