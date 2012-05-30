class Identity < OmniAuth::Identity::Models::ActiveRecord
  USER_ATTRIBUTES = [:package,:referred_by,:referer_id, :home_phone, :cell]

 attr_accessible :email, :name, :password_digest, :password, :password_confirmation, *USER_ATTRIBUTES
 attr_accessor *USER_ATTRIBUTES

 validates :name, presence: true
 validates :email, uniqueness: true, format: /^[^@\s]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
 validates :package, presence: true
 validates :referred_by, presence: true
 validates :referer_id, presence: true
 validates :home_phone, numericality: true, allow_blank: true
 validates :cell, numericality: true, allow_blank: true
end