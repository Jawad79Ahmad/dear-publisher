class SubCategory < ApplicationRecord
  before_create :set_rid, :set_created_by
  before_update :set_updated_by
  before_destroy :set_deleted_by

  belongs_to :created_by, class_name: :User, optional: true, foreign_key: :created_by_id
  belongs_to :updated_by, class_name: :User, optional: true, foreign_key: :updated_by_id
  belongs_to :deleted_by, class_name: :User, optional: true, foreign_key: :deleted_by_id

  belongs_to :category
end
