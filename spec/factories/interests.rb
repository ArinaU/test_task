# frozen_string_literal: true

FactoryBot.define do
  factory :interest do
    name { "Чтение" }

    factory :interest_with_users do
      transient do
        users_count { 1 }
      end

      after(:create) do |interest, evaluator|
        create_list(:user, evaluator.users_count, interests: [interest])
      end
    end
  end
end