# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
    preferred_shift { %w[morning afternoom].sample }
    classroom

    trait :student do
      role { :student }
      birthdate { rand(11..18).years.ago.to_date }
      registration_number { "A#{Time.now.year}#{Faker::Number.unique.number(digits: 4)}" }
    end

    trait :teacher do
      role { :teacher }
      birthdate { rand(28..60).years.ago.to_date }
      registration_number { "P#{Time.now.year}#{Faker::Number.unique.number(digits: 4)}" }
    end
  end
end