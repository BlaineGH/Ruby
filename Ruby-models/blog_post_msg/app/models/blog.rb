class Blog < ActiveRecord::Base
	has_many :comments, as: :commentable
	has_many :posts
	validates :name, :description, presence: true, length: {in: 2..255}
end
