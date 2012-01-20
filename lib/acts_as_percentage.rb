require "active_record"
require "acts_as_percentage/version"

module ActsAsPercentage
  def self.extended(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def acts_as_percentage(*attributes)
      attributes.each do |attribute|
        raise ArgumentError.new("#{self} does not respond to #{attribute}_as_basis_point") unless self.column_names.include?("#{attribute}_as_basis_point")
        
        basis_point_method_name = "#{attribute}_as_basis_point"
        
        define_method("#{attribute}") do
          self.__send__(basis_point_method_name) / 100.0 rescue nil
        end
        
        define_method("#{attribute}_ratio") do
          self.__send__(basis_point_method_name) / 10000.0 rescue nil
        end
        
        define_method("#{attribute}=") do |percentage|
          basis_point = percentage ? percentage * 100 : nil
          self.__send__("#{basis_point_method_name}=", basis_point)
        end
      end
    end
  end
  
end

ActiveRecord::Base.extend ActsAsPercentage