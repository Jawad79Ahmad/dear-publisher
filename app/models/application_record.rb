class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def set_rid
    self.rid = DateTime.now.strftime('%Y%m%d%H%M%S%N')
  end

  def set_created_by
    return unless Current.user.present?

    self.created_by_id = Current.user.id
  end

  def set_updated_by
    return unless Current.user.present?

    self.updated_by_id = Current.user.id
  end

  def set_deleted_by
    return unless Current.user.present?

    self.deleted_by_id = Current.user.id
  end
end
