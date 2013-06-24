class User < ActiveRecord::Base

  has_many :friendships,
    :dependent => :destroy

  has_many :friends,
    :through => :friendships,
    :conditions => "status = 'accepted'"

  has_many :pending_friends,
    :through => "Friendship",
    :conditions => "status = 'pending'",
    :order => :created_at

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user, :conditions => "status = 'accepted'"

  def all_friends
    @all_friends ||= friends + inverse_friends
  end

  validates_presence_of :name
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :items,
    dependent: :destroy,
    foreign_key: :user_id
end
