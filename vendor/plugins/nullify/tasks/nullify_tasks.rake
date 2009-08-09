def get_class
  klass = ENV['CLASS'] || ENV['class']
  raise 'Must specify CLASS' unless klass
  @class = Object.const_get(klass)
end
 
def get_columns
  raise "Class #{@class.name} has no nullified columns" unless @class.respond_to?(:nullified_columns)
  @columns = if column = ENV['COLUMN'] || ENV['column']
    raise "Class #{@class.name} has no nullified column #{column}" unless @class.nullified_columns.include?(column.to_sym)
    [column.to_sym]
  else @class.nullified_columns
  end
end

desc 'Sets blank columns to nil for a given CLASS (and optional COLUMN)'
task :nullify => :environment do
  get_class and get_columns
  @class.all.each do |instance|
    @columns.each do |column|
      value = instance[column]
      instance[column] = nil if !value.nil? && value.blank?
    end
    instance.save
  end
end
