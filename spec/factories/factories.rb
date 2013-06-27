require 'spec_helper'

FactoryGirl.define do

  factory :user do
    sequence(:name) {|n| "tinydancer#{n}"}
    sequence(:email) {|n| "person#{n}@example.com" }
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

  factory :user1, class: 'User' do
    name 'Bert'
    email 'Bert@seasame.st'
    password 'Bigbirdyo'
    password_confirmation 'Bigbirdyo'
  end

  factory :user2, class: 'User' do
    name 'Ernie'
    email 'Ernie@blah.com'
    password 'CountDrac'
    password_confirmation 'CountDrac'
  end










end
