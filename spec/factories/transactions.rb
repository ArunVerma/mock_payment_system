# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    uuid { [*('A'..'Z')].sample(8).join }
    amount { 10 }
    status { 'active' }
    merchant { create(:merchant) }
  end
end
