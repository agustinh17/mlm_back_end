class Identity < OmniAuth::Identity::Models::ActiveRecord
 attr_accessible :email, :name, :password_digest, :password, :password_confirmation

 validates :name, presence: true
 validates :email, uniqueness: true#, format: /^[^@\s]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
end