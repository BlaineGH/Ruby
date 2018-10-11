class User < ActiveRecord::Base
	#all the user's friends
	has_many :friends, foreign_key: :user_id, class_name: "Friend"
	has_many :my_friends, through: :friends, source: :friendee
	#all the friends with user
	has_many :user_friends, foreign_key: :friendee_id, class_name: "Friend"
	has_many :users_friends, through: :user_friends, source: :user
end
