class User < ActiveRecord::Base
	before_save { self.email.downcase! }
	before_create :create_remember_token

	validates :name, presence: true, length: { minimum: 2 }
	validates :email, presence: true, format: { with: /@/ }, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }

	has_secure_password

	has_many :posts

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end
	private

		def create_remember_token
			self.remember_token = User.digest(User.new_remember_token)
		end
end

