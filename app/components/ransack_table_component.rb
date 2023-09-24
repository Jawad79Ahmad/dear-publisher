# frozen_string_literal: true

class RansackTableComponent < ViewComponent::Base
  include TableHelper

  def initialize(table_data:, displayable_data:)
    @table_data = table_data || []
    @displayable_data = displayable_data || []
  end
end
