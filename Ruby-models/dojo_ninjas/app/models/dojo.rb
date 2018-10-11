class Dojo < ActiveRecord::Base
	has_many :ninjas
	validates :name, :city, :state, presence: true, length: { in: 2..20 }
end
