ActiveRecord::Schema.define do
  self.verbose = false
  
  create_table :progress_bars, :force => true do |t|
    t.integer :completed_as_basis_point
    t.timestamps
  end
end