class AddAncestryToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :ancestry, :string
    add_index :users, :ancestry
  end

  def self.down
    remove_index :users, :ancestry
    remove_column :users, :ancestry
  end  
end
