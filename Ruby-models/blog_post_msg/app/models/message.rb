class Message < ActiveRecord::Base
  belongs_to :posts
  belongs_to :users
  has_many :comments, as: :commentable
  validates :author, :message, presence: true, length: {in: 2..255}
end
