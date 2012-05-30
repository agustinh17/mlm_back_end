class User < ActiveRecord::Base
PACKAGE_IDS = { :platinum => 1, :gold => 2, :free => 3 }
attr_accessible :cell, :city, :company, :ein, :email, :home_phone, :name, :package, :provider, :referer_id, :referred_by, :spouse_name, :state, :street_address, :uid, :zip, :provider, :uid
has_ancestry :cache_depth => true

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

	def current_earnings
		return 0 unless self.has_platinum_package
		earnings = 0
		self.first_generation.each do |first_generation| 
			earnings += 50 if first_generation.has_platinum_package
		end
		return earnings
	end

	def self.total_earnings
		total_earnings = 0
		User.all.each do |user|
			total_earnings += user.current_earnings		
		end
		return total_earnings
	end

end
