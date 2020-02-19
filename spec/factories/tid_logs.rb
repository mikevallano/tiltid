FactoryBot.define do
  factory :tid_log do
    title { "MyString" }
    body { "MyText" }
    user { nil }
    public { false }
  end
end
