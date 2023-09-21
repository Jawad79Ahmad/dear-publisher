class Portal::BaseController < ApplicationController
  before_action :valid_user

  def valid_user
    roles = session[:user_roles]
    if current_user.blank? || User::ROLES.map { |role| roles.include?(role) }.any?(true).blank?
      flash[:alert] = 'Unauthorized to access'
      redirect_to root_path
    end
  end
end
