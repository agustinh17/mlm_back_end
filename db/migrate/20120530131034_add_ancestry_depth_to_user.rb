class AddAncestryDepthToUser < ActiveRecord::Migration
  def change
		add_column :users, :ancestry_depth, :integer, :default => 0
  end
end
