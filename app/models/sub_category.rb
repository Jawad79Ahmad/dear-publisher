class SubCategory < ApplicationRecord
  before_create :set_rid, :set_created_by
  before_update :set_updated_by
  before_destroy :set_deleted_by
end
