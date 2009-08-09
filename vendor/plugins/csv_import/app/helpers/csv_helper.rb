module Dallas
  module CsvHelper
  
    def csv_file_label(name = 'csv_file', text = 'CSV file to use', options = {})
      label_tag name, text, options
    end
  
    def csv_file_tag(name = 'csv_file', options = {})
      file_field_tag(name, options)
    end
  
    def csv_field_names_label(name = 'csv_field_names_in_first_row', text = 'Field name labels are in the first row.', options = {})
      label_tag name, text, options
    end
  
    def csv_field_names_check_box_tag(name = 'csv_field_names_check_box_tag', value = '1', checked = true, options = {})
      check_box_tag name, value, checked, options
    end
  
    def csv_rows_imported_content(wrapping_tag = :div, html_options = {})
      return '' unless @csv_rows_imported
      html_options[:class] = "#{html_options[:class]} csv-rows-imported-content".strip
      content_tag(
        wrapping_tag,
        (returning '' do |html|
          if @csv_bad_rows
            html << content_tag(:h3, "#{pluralize @csv_bad_rows.length, 'row'} failed. #{pluralize @csv_rows_imported, 'row'} <em>were <strong>not</strong></em> imported.")
            html << content_tag(:p, 'Anytime there are bad rows, the entire import is cancelled. This is to allow you to make corrections and re-run the import without having to manually roll back the previous attempt.')
          else
            html << content_tag(:h3, "#{pluralize @csv_rows_imported, 'row'} were successfully imported!")
          end
        end),
        html_options
      )
    end
  
    def csv_bad_rows_table(header = 'Bad CSV rows', html_options = {})
      return '' if @csv_bad_rows.blank?
      html_options[:class] = "#{html_options[:class]} csv-bad-rows-table".strip
      returning '' do |html|
        html << content_tag(:h3, header)
        html << content_tag(
          :table,
          (returning '' do |table|
            table << tag(:tr)
            @csv_field_names.each do |field_name|
              table << content_tag(:th, h(field_name))
            end
            table << '</tr>'
            @csv_bad_rows.each_with_index do |row, index|
              table << tag(:tr, :class => cycle('even', 'odd', :name => 'csv_row_cycle'))
                row.each do |cell|
                  table << tag(:td)
                    table << h(cell.to_s)
                    if cell.is_a?(Exception)
                      table << content_tag(:p, link_to_function('Toggle backtrace', %($('backtrace_#{index}').toggle();)))
                      table << content_tag(:div, cell.backtrace.map{|l| h(l)}.join, :id => "backtrace_#{index}", :style => 'display:none;')
                    end
                  table << '</td>'
                end
              table << '</tr>'
            end
            reset_cycle('csv_row_cycle')
          end),
          html_options
        )
      end
    end
  
    def csv_fields(csv_file_tag_name = 'csv_file', wrapping_tags = :p, with_labels = true)
      returning '' do |html|
        html << tag wrapping_tags, :class => 'csv-field-names'
          html << csv_field_names_check_box_tag
          html << csv_field_names_label if with_labels
        html << '</p>'
        html << tag wrapping_tags, :class => 'csv-file'
          html << csv_file_label if with_labels
          html << tag :br if with_labels
          html << csv_file_tag csv_file_tag_name
        html << '</p>'
        html << csv_rows_imported_content
        html << csv_bad_rows_table
      end
    end

  end
end