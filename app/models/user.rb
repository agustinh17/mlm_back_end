class User < ActiveRecord::Base
PACKAGE_IDS = { :platinum => 1, :gold => 2, :free => 3 }

has_ancestry :cache_depth => true

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

	def has_platinum_package
		package == PACKAGE_IDS[:platinum]
	end

	def has_gold_package
		package == PACKAGE_IDS[:gold]
	end

	def has_free_package
		package == PACKAGE_IDS[:free]
	end
	
	def first_generation
		children
	end

	def second_generation
		descendants(:at_depth => 2)
	end

	def network
		descendants.to_depth(2)
	end

	def current_earnings
		return 0 unless self.has_platinum_package
		earnings = 0
		first_generation.each do |user|
			earnings += self.earnings_from_user user
		end
		return earnings
	end

	def earnings_from_user(user)
		return 50 if (self.has_platinum_package) and (self.first_generation.include? user) and (user.has_platinum_package) 		
		return 0
	end

	def distance_from_user(user)
		return 0 unless self.descendants.include? user
		return user.depth - self.depth
	end

end
