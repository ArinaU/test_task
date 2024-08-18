# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { "Иван" }
    surname { "Иванов" }
    patronymic { "Иванович" }
    fullname { "Иван Иванов Иванович" }
    email { "ivan.ivanov@example.com" }
    age { 30 }
    nationality { "Русский" }
    country { "Россия" }
    gender { "male" }

    factory :user_with_interests_and_skills do
      transient do
        interests_count { 2 }
        skills_count { 1 }
      end

      after(:create) do |user, evaluator|
        create_list(:interest, evaluator.interests_count, users: [user])
        create_list(:skill, evaluator.skills_count, users: [user])
      end
    end
  end
end