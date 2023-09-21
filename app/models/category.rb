class Category < ApplicationRecord
  before_create :set_rid, :set_created_by
  before_update :set_updated_by
  before_destroy :set_deleted_by

  has_many :sub_categories
  belongs_to :created_by, class_name: :User, optional: true, foreign_key: :created_by_id
end
