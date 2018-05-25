class AddOwnerToGroup < ApplicationRecord
	add_column :groups, :owner, :string
end
