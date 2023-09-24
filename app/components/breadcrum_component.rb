# frozen_string_literal: true

class BreadcrumComponent < ViewComponent::Base
  def initialize(breadcrum_list:)
    @breadcrum_list = breadcrum_list || []
  end
end
