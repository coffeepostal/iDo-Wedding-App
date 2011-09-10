require 'csv'

# Include this in a controller
module CsvImport

	def each_csv_row(csv_file_param = :csv_file, rescue_exceptions = true)
	  return [] unless request.post? && params[csv_file_param]
	  
	  csv_file_param = :csv_file if csv_file_param.nil?
		@csv_rows_imported = 0
		ActiveRecord::Base.transaction do
			bad = false
			@csv_field_names = []
			CSV.parse(params[csv_file_param].read).each_with_index do |row, index|
			  if index.zero?
			    @csv_field_names = (params[:csv_field_names_in_first_row] ? row : (0..(row.length - 1)).to_a)
			    next if params[:csv_field_names_in_first_row]
			  end

				begin
				  row_hash = @csv_field_names.zip(row).inject({}) {|hash, pair| hash[pair.first] = pair.last; hash} unless @csv_field_names.blank?
					yield HashWithIndifferentAccess.new(row_hash)
					@csv_rows_imported += 1
				rescue Exception => e
				  if rescue_exceptions
						@csv_bad_rows ||= []
						@csv_bad_rows << (row + [e])
						bad = true
					else
					  raise e
					end
				end
			end
			raise ActiveRecord::Rollback if bad
		end
	end

end
