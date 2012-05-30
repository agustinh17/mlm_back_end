require 'spec_helper'

describe User, "Ancestry features" do
  before(:each) do
		@root = User.create
		@child = @root.children.create
    @valid_attributes = {
    }
  end

	it 'should have children' do
		@root.children.should == ([@child])
	end

	it 'should have parent' do
		@child.parent.should == (@root)
	end

	it 'should allow to create new children' do
		u = @root.children.create
		@root.children.should include (u)
		u.parent.should == (@root)
	end

	it 'should allow to search for grandsons' do
		u = @child.children.create
		@root.descendants(:at_depth => 2).should == ([u])
	end
end
#specs for public methods
	
describe User, "Validations" do
end


