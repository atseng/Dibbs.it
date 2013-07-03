require 'spec_helper'

FactoryGirl.define do

  factory :user do
    sequence(:name) {|n| "tinydancer#{n}"}
    sequence(:email) {|n| "person#{n}@example.com" }
    password 'northern_soul'
    password_confirmation 'northern_soul'
  end

  factory :item do
    sequence(:name) {|n| "Skip it#{n}"}
    category 'misc'
    description '90s skipping toy'
    value '15'
    association :user
  end

  factory :friendship do
    association :user
    association :friend, factory: :user
    status 'accepted'
  end

  factory :friendship1, class: 'Friendship' do
    association :user
    association :friend, factory: :user
    status 'accepted'
  end

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

  factory :loan do
    association :item
    association :owner, factory: :friend
    association :borrower, factory: :user
    state 'loaned'
  end
end
