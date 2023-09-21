class Role < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :user_roles
  has_many :users, through: :user_roles
end
