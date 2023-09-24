# frozen_string_literal: true

class TableComponent < ViewComponent::Base
  include TableHelper

  def initialize(table_data:, headers:, columns:, active_record_data:, query:)
    @table_data = table_data || []
    @headers = headers || []
    @columns = columns || []
    @active_record_data = active_record_data || []
    @query = query
  end
end
