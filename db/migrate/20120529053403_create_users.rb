class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :company
      t.string :spouse_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :ein
      t.string :home_phone
      t.string :cell
      t.string :email
      t.integer :package
      t.string :referred_by
      t.integer :referer_id

      t.timestamps
    end
  end
end
