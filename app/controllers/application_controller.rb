class ApplicationController < ActionController::Base
  before_action :set_current_attributes

  def after_sign_in_path(resource)
    session[:user_roles] = resource.roles.pluck('lower(name)')
    root_path
  end

  def set_current_attributes
    return unless current_user.present?

    Current.user = current_user
    Current.user_roles = current_user.roles.pluck('lower(name)')
  end
end
