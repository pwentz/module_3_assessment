FactoryGirl.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    image_url { Faker::Avatar.image }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
