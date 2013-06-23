require 'spec_helper'

FactoryGirl.define do

  factory :user do
    name 'Mos Def'
    email 'boogeymusic@jazz.com'
    password 'northern_soul'
    password_confirmation 'northern_soul'
  end

end
