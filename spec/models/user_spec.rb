require 'spec_helper'

describe User do
  before(:each) do
		@root = User.create(:name => 'root')
		@child = @root.children.create :name => 'child1'
    @valid_attributes = {
    }
  end

#specs for ancestry features
	it 'should have children' do
		@root.children.should == ([@child])
	end

	it 'should have parent' do
		@child.parent.should == (@root)
	end

	it 'should allow to create new children' do
		u = @root.children.create(:name => 'child 2')
		@root.children.should include (u)
		u.parent.should == (@root)
	end

	it 'should allow to search for grandsons' do
		u = @child.children.create :name => '2nd generation'
		@root.descendants(:at_depth => 2).should == ([u])
	end

#specs for public methods
	
end
