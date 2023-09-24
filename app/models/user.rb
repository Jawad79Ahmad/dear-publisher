class User < ApplicationRecord
  attr_accessor :login, :name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable, :lockable

  before_validation :set_username
  before_validation :check_username
  validates :username, uniqueness: { case_sensitive: false }, if: -> { username.present? }
  validates :email, presence: false, allow_nil: true, uniqueness: { case_sensitive: false }, if: -> { email.present? }
  validates :phone_number, presence: false, allow_nil: true

  belongs_to :active_role, class_name: :Role, optional: true, foreign_key: :current_role
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :categories, class_name: :Category, foreign_key: :created_by_id

  before_create :set_rid
  after_create :assign_default_role

  after_find do
    self.name = [first_name, last_name].map(&:to_s).join(' ')
  end

  ROLES = ['admin', 'writer', 'blogger', 'publisher'].freeze

  def assign_default_role
    self.add_role(:member) if self.roles.blank?
  end

  def set_username
    return if username.present?

    self.username = email || phone_number
  end

  def check_username
    return if self.username.present?

    if self.email.blank? && self.phone_number.blank?
      errors.add(:email, 'Phone OR email must present')
      errors.add(:phone_number, 'Phone OR email must present')
    end

    self.username = email || phone_number
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  def first_name=(value)
    value = value.blank? ? '' : value
    super(value)
  end

  def last_name=(value)
    value = value.blank? ? '' : value
    super(value)
  end

  def self.find_for_database_authentication(conditions = {})
    login_param = conditions[:login].downcase
    find_by('lower(username) = ? OR lower(email) = ? OR phone_number = ?', login_param, login_param, login_param)
  end

  def login=(login)
    @login = self.username || self.email || self.phone_number
  end

  def login
    @login || self.username || self.email || self.phone_number
  end

  def add_role(role_name)
    user_roles.build(role: Role.find_or_create_by(name: role_name.downcase)).save
  end

  def has_role?(role_name)
    UserRole.joins(:role).exists?('role.name': role_name.downcase, user_id: id)
  end

  def active_role_name
    return if active_role.blank?

    active_role.name.titleize
  end

  def member?
    active_role_name.to_s.downcase.eql?('member')
  end
end
