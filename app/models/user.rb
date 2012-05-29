class User < ActiveRecord::Base
  attr_accessible :cell, :city, :company, :ein, :email, :home_phone, :name, :package, :provider, :referer_id, :referred_by, :spouse_name, :state, :street_address, :uid, :zip, :provider, :uid

  def self.from_omniauth(auth)
   find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
   create! do |user|
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.name = auth["info"]["name"]
   end
  end
end
