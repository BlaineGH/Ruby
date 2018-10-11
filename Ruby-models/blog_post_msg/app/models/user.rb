class User < ActiveRecord::Base
	has_many :comments, as: :commentable
	has_many :owners
	has_many :posts
	has_many :messages
	has_many :blogs_owned, through: :owners, source: :blogs
	has_many :posts_on_blogs, through: :posts, source: :blogs
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence: true, length: { in: 2..20 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
