class Post < ActiveRecord::Base
  belongs_to :blogs
  belongs_to :users
  has_many :comments, as: :commentable
  validates :title, presence: true, length: {in: 2..20}
  validates :content, presence: true, length: {in: 7..255}
end
