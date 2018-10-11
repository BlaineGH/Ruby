class Friend < ActiveRecord::Base
  belongs_to :user, required: true, foreign_key: :user_id, class_name: "User"
  belongs_to :friendee, required: true, foreign_key: :friendee_id, class_name: "User" 
end
