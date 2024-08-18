# frozen_string_literal: true

FactoryBot.define do
  factory :skill do
    name { "Ruby" }

    factory :skill_with_users do
      transient do
        users_count { 1 }
      end

      after(:create) do |skill, evaluator|
        create_list(:user, evaluator.users_count, skills: [skill])
      end
    end
  end
end
