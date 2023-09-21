class CreateSubCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_categories do |t|
      t.string :rid,                unique: true
      t.string :name,               null: false
      t.references :category

      t.integer :created_by_id
      t.integer :updated_by_id
      t.integer :deleted_by_id
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :sub_categories, :deleted_at
  end
end
