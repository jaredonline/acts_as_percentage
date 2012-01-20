class ProgressBar < ActiveRecord::Base
  acts_as_percentage :completed
end