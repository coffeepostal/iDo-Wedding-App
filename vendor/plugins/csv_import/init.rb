# Include hook code here

config.to_prepare do
	ApplicationController.helper(Dallas::CsvHelper)
end
