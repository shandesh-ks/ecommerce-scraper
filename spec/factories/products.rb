FactoryBot.define do
  factory :product do
    category { nil }
    title { "MyString" }
    description { "MyText" }
    price { "MyString" }
    size { "MyString" }
    url { "MyString" }
    available { "MyString" }
    offers { "MyString" }
    offer_percentage { "MyString" }
    rating { "MyString" }
    Specifications { "MyString" }
    reviews { "MyString" }
    last_scraped_at { "2025-02-22 18:45:22" }
  end
end
