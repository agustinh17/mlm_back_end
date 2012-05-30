# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
root = User.create :name => 'root'
ch1 = root.children.create :name => 'child 1', :email => 'child1@mlm.com', :package => 1
ch2 = root.children.create :name => 'child 2', :email => 'child2@mlm.com', :package => 1
ch3 = root.children.create :name => 'child 3', :email => 'child3@mlm.com', :package => 2

sch1 = ch1.children.create :name => 'subch 1.1', :email => 'subchild_1_1@mlm.com', :package => 1
sch2 = ch2.children.create :name => 'subch 2.1', :email => 'subchild_2_1@mlm.com', :package => 3
sch3 = ch3.children.create :name => 'subch 3.1', :email => 'subchild_3_1@mlm.com', :package => 1

#users = 
#	User.create([{ name: 'Agustin', email: 'agustinh17@gmail.com', parent_id: root.id}, { name: 'Andy', email: 'andyjbas@gmail.com', parent_id: root.id} ])
