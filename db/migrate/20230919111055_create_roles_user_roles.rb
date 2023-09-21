class CreateRolesUserRoles < ActiveRecord::Migration[7.0]
  def change
    create_table(:roles) do |t|
      t.string :name

      t.timestamps
    end

    create_table(:user_roles) do |t|
      t.references :user
      t.references :role
    end

    add_column :users, :current_role, :integer

    add_index :roles, 'lower(name)', name: 'add_unique_name_with_downcase_in_roles', unique: true
    add_index :user_roles, [:user_id, :role_id], name: 'add_unique_user_roles_with_user_and_role', unique: true
  end
end
