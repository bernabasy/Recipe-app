FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { 'john@example.com' }
    password { 'password123' }
    confirmed_at { nil }
  end
end
