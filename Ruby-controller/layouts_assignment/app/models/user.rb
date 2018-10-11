class User < ActiveRecord::Base
	has_many :posts
	validates :first_name, :last_name, :language, presence: true, length: {in: 2..25}
end
