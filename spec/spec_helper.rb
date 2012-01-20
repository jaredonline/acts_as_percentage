require 'acts_as_percentage'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => File.dirname(__FILE__) + "/acts_as_percentage.sqlite3")

load File.dirname(__FILE__) + '/support/schema.rb'
load File.dirname(__FILE__) + '/support/models.rb'
load File.dirname(__FILE__) + '/support/data.rb'
