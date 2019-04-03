FactoryBot.define do
  factory :til_log do
    title { "MyString" }
    body { "MyText" }
    public { false }
    user { nil }
  end
end
