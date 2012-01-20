# Installing
`gem "acts_as_percentage"`

# Requirements
Rails 3.1.x

# Usage

Allows you to store percent values as an integer.  

  class ProgressBar < ActiveRecord::Base
    percentage :completed
  end


This assumes there is a column in the database named <tt>completed_as_basis_point (Integer)</tt>. It creates
several helper methods for you:

  pb = ProgressBar.create(:completed => 59.87) # => <ProgressBar: @completed_as_basis_point=5987>
  pb.completed # => 59.87
  pb.completed_ratio # => 0.5987
  pb.completed_as_basis_point # => 5987


Raises `ArgumentError` if the column specified is not present
