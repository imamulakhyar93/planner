# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { Faker::Name.name }
    user { create(:user) }
    project { create(:project) }
  end
end
