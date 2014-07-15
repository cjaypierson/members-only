class User < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 2 }
	validates :email, presence: true, format: { with: /@/ }, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }

	has_secure_password


end

