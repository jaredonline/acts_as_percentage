require 'spec_helper'

describe "acts_as_percentage" do
  let(:progress_bar) { ProgressBar.create(:completed_as_basis_point => 7569) }
  
  it "has completed" do
    progress_bar.completed.should eql(75.69)
  end
  
  it "has completed_as_basis_point" do
    progress_bar.completed_as_basis_point.should eql(7569)
  end
  
  it "has completed_ratio" do
    progress_bar.completed_ratio.should eql(0.7569)
  end
  
  it "allows the setting of a perctage" do
    progress_bar.completed = 89.19
    progress_bar.completed_as_basis_point.should eql(8919)
    progress_bar.completed.should eql(89.19)
    progress_bar.completed_ratio.should eql(0.8919)
  end
  
  it "allows setting of nil" do
    progress_bar.completed = nil
    progress_bar.completed_as_basis_point.should be_nil
    progress_bar.completed.should be_nil
    progress_bar.completed_ratio.should be_nil
  end
end