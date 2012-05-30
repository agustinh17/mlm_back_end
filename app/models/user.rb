class User < ActiveRecord::Base
  attr_accessible :cell, :city, :company, :ein, :home_phone, :spouse_name, :state, :street_address, :zip

  def self.from_omniauth(auth,params)
   find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth,params)
  end

  def self.create_with_omniauth(auth,params)
   create! do |user|
     accessible_attributes = User.accessible_attributes.to_a
     accessible_attributes.shift()
     accessible_attributes.each do |attr|
       user[attr.to_sym] = params[attr]
     end

     user.provider = auth["provider"]
     user.uid = auth["uid"]
     user.name = auth["info"]["name"]
     user.email = auth["info"]["email"]
     user.package = params["package"] if params["package"].present?
     user.referred_by = params["referred_by"] if params["referred_by"].present?
     user.referer_id = params["referer_id"] if params["referer_id"].present?
   end
  end
end
