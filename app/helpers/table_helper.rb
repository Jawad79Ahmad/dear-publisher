# frozen_string_literal: true

# Table helper
module TableHelper
  def get_row_data(record, column_list)
    row = []
    column_list.each do |column|
      col_value = record[column]
      if column.include?(', ')
        col_values = []
        column.split(', ').each do |col|
          cols = col.split('.')
          cols.each_with_index do |co, i|
            break if col_value.blank? && i != 0

            col_value = i.eql?(0) ? record[co] : col_value.present? ? col_value[co] : ''
            col_values.push(col_value) if col_value.present? && i != 0
          end
        end
        col_value = col_values.map(&:to_s).join(' ')
      end
      row.push(col_value)
    end
    row
  end
end
