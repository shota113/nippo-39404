FactoryBot.define do
  factory :diary do
    association :user

    category_id       {Faker::Number.between(from: 2, to: 4)}
    place             {Faker::Name.name}
    work              {Faker::Lorem.context}
    start_time        {'21:00'}
    ending_time       {'22:00'}

    after(:build) do |diary|
      diary.image.attach(io: File.open('public/image/test2-image.png'), filename: 'test2-image.png')
    end
  end
end
