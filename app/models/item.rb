class Item < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :value

  attr_accessible :avatar, :description, :name, :user_id, :value
end
