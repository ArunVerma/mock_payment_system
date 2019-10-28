# frozen_string_literal: true

FactoryBot.define do
  factory :merchant do
    sequence(:name, 1) { |n| "Test Merchant#{n}" }
    sequence(:description, 1) { |n| "Test description #{n}" }
    sequence(:email, 1) { |n| "email#{n}@msys.com" }
    status { 'active' }
    transactions_sum { 100.00 }
  end
end
