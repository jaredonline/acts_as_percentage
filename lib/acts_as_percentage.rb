require "active_record"
require "acts_as_percentage/version"

module ActsAsPercentage #:nodoc:
  def self.extended(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods #:nodoc:
    
    # Allows you to store percent values as an integer.  
    # 
    #   class ProgressBar < ActiveRecord::Base
    #     percentage :completed
    #   end
    # 
    # This assumes there is a column in the database named <tt>completed_basis_point (Integer)</tt>. It creates
    # several helper methods for you:
    # 
    #   pb = ProgressBar.create(:completed => 59.87) # => <ProgressBar: @completed_basis_point=5987>
    #   pb.completed # => 59.87
    #   pb.completed_ratio # => 0.5987
    #   pb.completed_basis_point # => 5987
    # 
    # Raises <tt>ArgumentError</tt> if the column specified is not present
    # 
    def percentage(*attributes)
      attributes.each do |attribute|
        basis_point_attribute = "#{attribute}_basis_point"
        raise ArgumentError.new("#{self} does not respond to #{basis_point_attribute}") unless self.column_names.include?("#{basis_point_attribute}")
        
        define_method("#{attribute}") do
          self.__send__(basis_point_attribute) / 100.0 rescue nil
        end
        
        define_method("#{attribute}_ratio") do
          self.__send__(basis_point_attribute) / 10000.0 rescue nil
        end
        
        define_method("#{attribute}=") do |percentage|
          basis_point = percentage ? (percentage * 100).round : nil
          self.__send__("#{basis_point_attribute}=", basis_point)
        end
      end
    end
  end
  
end

ActiveRecord::Base.extend ActsAsPercentage