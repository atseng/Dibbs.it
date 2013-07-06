require 'spec_helper'

FactoryGirl.define do

  factory :user do
    sequence(:name) {|n| "tinydancer#{n}"}
    sequence(:email) {|n| "person#{n}@example.com" }
    password 'northern_soul'
    password_confirmation 'northern_soul'
    receives_notifications false
  end

  factory :item do
    sequence(:name) {|n| "Skip it#{n}"}
    activity 'Night In'
    category 'Misc'
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
    sequence(:name) {|n| "Bert#{n}"}
    sequence(:email) {|n| "bert#{n}@seasamest.com" }
    password 'Bigbirdyo'
    password_confirmation 'Bigbirdyo'
    receives_notifications false
    factory :user1_with_items do
      after(:create) do |user|
        FactoryGirl.create_list(:item, 1, user: user)
      end
    end
  end

  factory :user2, class: 'User' do
    name 'Ernie'
    sequence(:email) {|n| "ernie#{n}@set.com" }
    password 'CountDrac'
    password_confirmation 'CountDrac'
    receives_notifications false
  end

  factory :loan do
    association :item
    association :owner, factory: :friend
    association :borrower, factory: :user
    state 'loaned'
  end
end
