class Category < ApplicationRecord
  before_create :set_rid, :set_created_by
  before_update :set_updated_by
  before_destroy :set_deleted_by

  belongs_to :created_by, class_name: :User, optional: true, foreign_key: :created_by_id
  belongs_to :updated_by, class_name: :User, optional: true, foreign_key: :updated_by_id
  belongs_to :deleted_by, class_name: :User, optional: true, foreign_key: :deleted_by_id

  has_many :sub_categories

  def self.data_for_index
    {
      headers: ['id', 'name', 'created_by', 'created_at', 'updated_at'],
      row_data: [
        'id', 'name', 'created_by.first_name, created_by.last_name, created_by.username',
        'created_at', 'updated_at'
      ]
    }
  end
end
