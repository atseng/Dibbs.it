require 'spec_helper'

FactoryGirl.define do

  factory :user do
    name 'Mos Def'
    email 'boogeymusic@jazz.com'
    password 'northern_soul'
    password_confirmation 'northern_soul'
  end

  factory :item do
    name 'Skip it'
    description '90s skipping toy'
    value '15'
  end

  # factory :friendship do
  #   user 'Lin'
  #   friend 'Allen'
  #   status 'accepted'

  # end












end
