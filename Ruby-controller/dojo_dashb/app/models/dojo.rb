class Dojo < ActiveRecord::Base
	validates :branch, :street, :city, :state, presence: true, length:{in: 2..25}
	has_many :students
end
