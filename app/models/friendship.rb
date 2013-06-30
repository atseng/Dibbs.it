class Friendship < ActiveRecord::Base
  validates_presence_of :user, :friend, :status

  # validates_uniqueness_of :

  belongs_to :user

  belongs_to :friend,
    :class_name => "User",
    :foreign_key => "friend_id"

  attr_accessible :friend_id, :status, :user_id

end

