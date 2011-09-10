module LaserLemon
  module Nullify
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def nullify(*columns)
        write_inheritable_array :nullified_columns, columns.map(&:to_sym)
        class_inheritable_reader :nullified_columns
        
        columns.each do |column|
          define_method "#{column}=" do |value|
            write_attribute(column, value.blank? ? nil : value)
          end
        end
        
        include InstanceMethods
        
        before_validation :nullify_columns
        before_save :nullify_columns
      end
    end
    
    module InstanceMethods
      def nullify_columns
        self.class.nullified_columns.each do |column|
          value = read_attribute(column)
          write_attribute(column, nil) if !value.nil? && value.blank?
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, LaserLemon::Nullify)
