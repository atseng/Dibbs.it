class Item < ActiveRecord::Base
  attr_accessible :avatar, :description, :name, :user_id, :value
end
