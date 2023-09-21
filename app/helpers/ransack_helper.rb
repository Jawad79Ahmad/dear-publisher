# frozen_string_literal: true

# Ransack helper
module RansackHelper
  def ransack_get_param(param_name)
    params[:q][param_name.to_sym] if params[:q].present?
  end
end
