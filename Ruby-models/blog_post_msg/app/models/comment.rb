class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  validates :content, presence: true, length: {in: 7..255}
end
