class AddColumnsToAdmin < ActiveRecord::Migration
  def change
    add_column :administration_admins, :username, :string
    add_column :administration_admins, :first_name, :string
    add_column :administration_admins, :last_name, :string
  end
end
